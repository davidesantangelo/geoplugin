# Geoplugin

This is a Ruby wrapper library around the API provided by <a target="_BLANK" href="http://www.geoplugin.com">Geoplugin</a>. Geoplugin is the easiest way for you to know where your visitors are from so that you can provide them with content more relevant to their geographical location. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geoplugin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geoplugin

## Usage

```ruby
require 'geoplugin'

# Find my location without ssl
location = Geoplugin.me

# Find my location with ssl
location = Geoplugin.me(:ssl => true, :key => 'your geoplugin key')


# Find ip location with ssl
location = Geoplugin.new('8.8.8.8')

# Find my location with ssl
location = Geoplugin.new('8.8.8.8', :ssl => true, :key => 'your geoplugin key')

Like all calls to any of geoPlugin's web services, the default base_currency is USD ($US). 
Thus, if your base currency is NOT $US, then you must add the variable base_currency=XXX to the call like this:

location = Geoplugin.new('151.72.254.22', :base_currency => "EUR")
location = Geoplugin.me(:base_currency => "EUR")

```

<i>To use the SSL web services, <a href="http://www.geoplugin.com/premium#ssl_access_per_year" target="_BLANK">an inexpensive key is required. </a></i>
## Attributes

request, 
status, 
city, 
region, 
areacode, 
dmacode, 
countrycode, 
countryname, 
continentcode, 
latitude, 
longitude, 
regioncode, 
regionname, 
currencycode, 
currencysymbol, 
currencysymbol_utf, 
currencyconverter

## Credits
Many thanks to Geoplugin for his implementation of the API.

## License
The restcountry GEM is released under the MIT License.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/geoplugin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
