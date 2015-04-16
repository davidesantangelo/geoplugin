require 'spec_helper'
require 'vcr'

describe Geoplugin do
  it 'has a version number' do
    expect(Geoplugin::VERSION).not_to be nil
  end

  it 'expect status 200' do
  	VCR.use_cassette 'locate my ip without ssl' do
    	response = Geoplugin.me
   		expect(response.status).to eq(200)
   	end
  end

   it 'expect status 200' do
  	VCR.use_cassette 'locate my ip with ssl' do
    	response = Geoplugin.me(:ssl => true, :key => 'your geoplugin key')
   		expect(response.status).to eq(200)
   	end
  end

  it 'get countryName United States with ip 8.8.8.8' do
  	VCR.use_cassette 'locate ip 8.8.8.8 without ssl' do
    	response = Geoplugin.new('8.8.8.8')
   		expect(response.countryname).to eq('United States')
   	end
  end

  it 'get countryName United States with ip 8.8.8.8 with SSL' do
  	VCR.use_cassette 'locate ip 8.8.8.8 with ssl' do
    	response = Geoplugin.new('8.8.8.8', :ssl => true, :key => 'your geoplugin key')
   		expect(response.countryname).to eq('United States')
   	end
  end
end
