property :package_name, String, name_property: true
property :sauce, String

resource_name :remote_dpkg

action :install do

  deb = "#{Chef::Config['file_cache_path']}/#{package_name}.deb"

  remote_file deb do
    source sauce
  end

  dpkg_package 'install' do
    source deb
    subscribes :install, "remote_file[#{deb}]"
    action :nothing
  end

end
