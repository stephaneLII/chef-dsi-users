#
# Cookbook Name:: dsi-users
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
dsi_users 'sysadmin' do
  username 'sysadmin'
  password '$1$VM6v4sqy$bfSf0EFE5UEoIodlvsMND/'
end

dsi_users 'vagrant' do
  username 'vagrant'
  password '$1$R984ZKx5$h3A2vMI5O1LV9sDvSKtnR0'
end
