#
# Cookbook Name:: unorganized_apps
# Recipe:: nodejs
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file 'nvm' do
  source 'https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh'
  path "#{Chef::Config['file_cache_path']}/nvm.sh"
  mode 0755
end

execute 'install nvm' do
  command "#{Chef::Config['file_cache_path']}/nvm.sh"
  user node['user']
  subscribes :run, 'remote_file[nvm]', :immediately
  action :nothing
end

node['nodejs']['versions'].each do |nodeVersion|
  
  bash "install node@#{nodeVersion}" do
    code "source ~/.nvm/nvm.sh; nvm install #{nodeVersion};"
    user node['user']
  end
  
  node['nodejs']['global_packages'].each do |package|
    bash "install #{package} for NodeJS v#{nodeVersion}" do
      code "source ~/.nvm/nvm.sh; nvm use #{nodeVersion}; npm install -g #{package}"
      creates "/home/#{node['user']}/.nvm/versions/node/v#{nodeVersion}/lib/node_modules/#{package}"
      user node['user']
      action :nothing
      subscribes :run, "bash[install node@#{nodeVersion}]"
    end
  end
  
end

bash "defaults" do
  code "source ~/.nvm/nvm.sh; nvm alias default #{node['nodejs']['version']}; nvm use default"
end
