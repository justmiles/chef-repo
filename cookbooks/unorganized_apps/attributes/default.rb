
default['global_packages'] = %w()

users = []

node['etc']['passwd'].each do |user, data|

  if data['uid'].to_i > 999 and user != 'nobody'
    users.push user
  end

end

default['users'] = users



#intellij
# https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release
require 'net/http'
require 'json'

uri = URI('https://data.services.jetbrains.com/products/releases')
params = { :code => 'IIU', :latest => true, :type => 'release' }
uri.query = URI.encode_www_form(params)

res = Net::HTTP.get_response(uri)

if res.is_a?(Net::HTTPSuccess)
  versions = JSON.parse(res.body)
  default['intellij']['version'] = versions['IIU'][0]['version']
  
  case node['os']
  when 'linux'
    default['intellij']['remote_url'] = versions['IIU'][0]['downloads']['linux']['link']
  when 'darwin'
    default['intellij']['remote_url'] = versions['IIU'][0]['downloads']['mac']['link']
  when 'windows'
    default['intellij']['remote_url'] = versions['IIU'][0]['downloads']['windows']['link']
  end
end
