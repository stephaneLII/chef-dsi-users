define :dsi_users, username: nil, password: nil do

  user params[:username] do
    supports manage_home: true
    comment "#{params[:username]} User"
    home "/home/#{params[:username]}"
    shell '/bin/bash'
    password params[:password]
  end

  sudo params[:username] do
    user params[:username]
  end
end
