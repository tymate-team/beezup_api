# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beezup_api/version'

Gem::Specification.new do |spec|
  spec.name          = "beezup_api"
  spec.version       = BeezupApi::VERSION
  spec.authors       = ["Fabien Piette"]
  spec.email         = ["fabien@tymate.com"]

  spec.description   = 'A Ruby interface to the Beezup API.'
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/tymate-team/beezup_api"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'unirest'
  spec.add_dependency 'hashie', '~> 3.0'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'simplecov', '~> 0.7'
  spec.add_development_dependency 'vcr', '~> 2.5'
  spec.add_development_dependency 'webmock', '~> 1.11'
end
