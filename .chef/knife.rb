current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
cache_options( :path => "#{current_dir}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
