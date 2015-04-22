require "geoplugin/version"
require "geoplugin/locate"

module Geoplugin
	def self.me(options = {})
		location = Geoplugin::Locate.locate(nil, options)
	end

 	def self.new(ip = nil, options = {})
   	location = Geoplugin::Locate.locate(ip, options)
  end
end
