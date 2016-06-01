#
# Cookbook Name:: unorganized_apps
# Recipe:: nodejs
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node['global_packages'].each do |package_name|
  package package_name
end

