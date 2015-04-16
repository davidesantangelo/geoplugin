require "geoplugin/version"
require "geoplugin/locate"

module Geoplugin
	def self.me(options = {})
		location = options[:ssl] ? Geoplugin::Locate.ssl_locate_no_ip(options[:key]) : Geoplugin::Locate.locate_no_ip
	end

 	def self.new(ip, options = {})
   	location = options[:ssl] ? Geoplugin::Locate.ssl_locate(options[:key], ip) : Geoplugin::Locate.locate(ip)
  end
end
