
default['global_packages'] = %w()

users = []

node['etc']['passwd'].each do |user, data|

  if data['uid'].to_i > 999 and user != 'nobody'
    users.push user
  end

end

default['users'] = users
