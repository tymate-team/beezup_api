require "beezup_api/version"
require 'unirest'

module BeezupApi
  class << self
    attr_accessor :user_id, :primary_token, :debug

    # config/initializers/beezup_api.rb (for instance)
    #
    # ```ruby
    # BeezupApi.configure do |config|
    #   config.user_id = 'blu'
    #   config.primary_token = 'blu'
    #   config.debug = false
    # end
    # ```
    # elsewhere
    #
    # ```ruby
    # client = BeezupApi::Client.new
    # ```
    def configure
      yield self
      true
    end
  end

  autoload :Api,             "beezup_api/api"
  autoload :Client,          "beezup_api/client"
  autoload :OrderList,       "beezup_api/order_list"
  autoload :OrderDetail,     "beezup_api/order_detail"
  autoload :Errors,          "beezup_api/errors"
  autoload :Helpers,         "beezup_api/helpers"
  autoload :Version,         "beezup_api/version"
end
