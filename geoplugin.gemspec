# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geoplugin/version'

Gem::Specification.new do |spec|
  spec.name          = "geoplugin"
  spec.version       = Geoplugin::VERSION
  spec.authors       = ["Davide Santangelo"]
  spec.email         = ["davide.santangelo@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.summary       = %q{This is a Ruby wrapper library around the API provided by Geoplugin (http://www.geoplugin.com) API.}
  spec.description   = %q{This is a Ruby wrapper library around the API provided by Geoplugin. Geoplugin is the easiest way for you to know where your visitors are from so that you can provide them with content more relevant to their geographical location.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "typhoeus"

  spec.required_ruby_version = ">= 1.9.3"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
  spec.add_dependency "ipaddress"
end
