

remote_dpkg 'atom' do
    sauce 'https://atom.io/download/deb'
end


node['atom']['packages'].each do |package|
  
  execute "Install Atom Package #{package}" do
    command "apm install #{package}"
    user node['user']
    creates "/home/#{node['user']}/.atom/packages/#{package}"
  end
  
end


