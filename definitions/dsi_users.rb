define :dsi_users, username: nil, password: nil, passwordless: false do # ~FC015

  if node['dsi-users']['databag']['encrypted'] == true
    secret = Chef::EncryptedDataBagItem.load_secret(node['dsi-users']['databag']['path'])
    item =  Chef::EncryptedDataBagItem.load(node['dsi-users']['databag']['name'], params[:name], secret)
  else
    item = data_bag_item(node['dsi-users']['databag']['name'], params[:name])
  end

  home_directory = "/home/#{params[:name]}"
  if params[:password].to_s == ''
    user_password = item['password']
  else
    user_password = params[:password]
  end

  user params[:name] do
    supports manage_home: true
    comment "#{params[:name]} User"
    home home_directory
    shell '/bin/bash'
    password user_password
  end

  sudo params[:name] do
    user params[:name]
    nopasswd params[:passwordless]
  end

  directory "#{home_directory}/.ssh" do
    owner params[:name]
    group params[:name]
    mode 0700
    action :create
    only_if "test -d #{home_directory}"
  end

  template "#{home_directory}/.ssh/authorized_keys" do
    source 'authorized_keys.erb'
    owner params[:name]
    group params[:name]
    variables ssh_keys: item['ssh_keys']
  end

end
