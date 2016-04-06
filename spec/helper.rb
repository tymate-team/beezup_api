# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
if ENV['COVERAGE'] == 't'
  require 'simplecov'
  SimpleCov.start
end

require 'beezup_api'
require 'rspec'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir     = 'spec/fixtures/cassette_library'
  c.hook_into                :webmock
  c.ignore_localhost         = true
  c.default_cassette_options = { :record => :none }
  c.configure_rspec_metadata!
end

def bezzup_url(url)
  url =~ /^http/ ? url : "https://api.beezup.com#{url}"
end

def expect_post(url, body, result = nil)
  a_request(:post, bezzup_url(url)).with({
    :body => fixture(body).read,
    :headers => { :content_type => 'application/json' }
  }).should have_been_made.once
end
