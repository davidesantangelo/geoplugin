require 'faraday'
require 'json'
require 'ipaddress'

API_URL = "http://www.geoplugin.net/json.gp"
API_SSL_URL = "https://ssl.geoplugin.net/json.gp"

module Geoplugin
	class	Locate
		attr_reader :request, 
								:status, 
								:city, 
								:region, 
								:areacode, 
								:dmacode, 
								:countrycode, 
								:countryname, 
								:continentcode, 
								:latitude, 
								:longitude, 
								:regioncode, 
								:regionname, 
								:currencycode, 
								:currencysymbol, 
								:currencysymbol_utf, 
								:currencyconverter

		def initialize(attributes)
      @request = attributes["geoplugin_request"]
      @status = attributes["geoplugin_status"]
      @city = attributes["geoplugin_city"]
      @region = attributes["geoplugin_region"]
      @areacode = attributes["geoplugin_areaCode"]
      @dmacode = attributes["geoplugin_dmaCode"]
      @countrycode = attributes["geoplugin_countryCode"]
      @countryname = attributes["geoplugin_countryName"]
      @continentcode = attributes["geoplugin_continentCode"]
      @latitude = attributes["geoplugin_latitude"]
      @longitude = attributes["geoplugin_longitude"]
      @regioncode = attributes["geoplugin_regionCode"]
      @regionname = attributes["geoplugin_regionName"]
      @currencycode = attributes["geoplugin_currencyCode"]
      @currencysymbol = attributes["geoplugin_currencySymbol"]
      @currencysymbol_utf = attributes["geoplugin_currencySymbol_UTF8"]
      @currencyconverter = attributes["geoplugin_currencyConverter"]
    end

    # locate with ip
    def self.locate(ip)
    	response = get_response(ip)
    	new(response) if not response.empty?
    end

    def self.ssl_locate(key, ip)
    	response = get_ssl_response(key, ip)
    	new(response) if not response.empty?
    end

    #locate without ip
    def self.locate_no_ip
    	response = get_response
    	new(response) if not response.empty?
    end

    def self.ssl_locate_no_ip(key)
    	response = get_ssl_response(key)
    	new(response) if not response.empty?
    end

  private
	  def self.get_response(ip = nil)

	  	return [] if ip and not IPAddress.valid? ip
	  
	  	url = ip ? URI.parse(URI.encode("#{API_URL}?ip=#{ip}")) : URI.parse(URI.encode("#{API_URL}"))
	    response = Faraday.get(url)
	    return response.success? ? JSON.parse(response.body) : []
	  end

	  def self.get_ssl_response(key, ip = nil)

	  	return [] if ip and not IPAddress.valid? ip

	  	url = ip ? URI.parse(URI.encode("#{API_SSL_URL}?ip=#{ip}&k=#{key}")) : URI.parse(URI.encode("#{API_SSL_URL}?k=#{key}"))
	    response = Faraday.get(url)
	    return response.success? ? JSON.parse(response.body) : []
	  end
	end
end