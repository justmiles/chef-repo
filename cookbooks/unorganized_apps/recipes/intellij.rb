#
# Cookbook Name:: unorganized_apps
# Recipe:: intellij
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#TODO: Install Java

version = '2016.1.1'
install_dir = '/opt/intellij'


remote_file '/tmp/ideaIU.tar.gz' do
  source "https://download.jetbrains.com/idea/ideaIU-#{version}.tar.gz"
  action :create
end

directory install_dir do
  recursive true
  action :create
  subscribes :delete, "remote_file[/tmp/ideaIU.tar.gz]", :immediately
end

bash 'intellij' do
  code "tar -zxf ideaIU.tar.gz --transform 's_^idea-IU-[0-9]*\.[0-9]*\.[0-9]*/_intellij/_'  -C /opt/"
  cwd '/tmp'
  subscribes :run, "remote_file[/tmp/ideaIU.tar.gz]", :delayed
end


node['users'].each do |user, data|

    cookbook_file "/home/#{user}/Desktop/IntelliJ.desktop" do
      source 'intellij.desktop'
      owner user
      group user
      mode 0755
    end

end
