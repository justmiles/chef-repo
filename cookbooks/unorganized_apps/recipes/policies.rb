#
# Cookbook Name:: unorganized_apps
# Recipe:: policies
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/nsswitch.conf" do
  source "nsswitch.conf.erb"
  owner "root"
  group "root"
end

node['users'].each do |user, data|
  
  user "create #{user}" do 
    username user
    home "/home/#{user}"
    shell data[:shell] or '/bin/bash'
  end
  
end