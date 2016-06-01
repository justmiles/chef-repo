#
# Cookbook Name:: unorganized_apps
# Recipe:: chef-dk
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_dpkg 'virtualbox' do
    sauce 'http://download.virtualbox.org/virtualbox/5.0.20/virtualbox-5.0_5.0.20-106931~Ubuntu~trusty_amd64.deb'
end

remote_dpkg 'vagrant' do
    sauce 'https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb'
end

remote_dpkg 'chefdk' do
    sauce 'https://packages.chef.io/stable/debian/8/chefdk_0.12.0-1_amd64.deb'
end
