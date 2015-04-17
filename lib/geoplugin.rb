require "geoplugin/version"
require "geoplugin/locate"

module Geoplugin
	def self.me(options = {})
		location = options[:ssl] ? Geoplugin::Locate.ssl_locate(nil, options[:key]) : Geoplugin::Locate.locate
	end

 	def self.new(ip = nil, options = {})
   	location = options[:ssl] ? Geoplugin::Locate.ssl_locate(ip, options[:key]) : Geoplugin::Locate.locate(ip)
  end
end
