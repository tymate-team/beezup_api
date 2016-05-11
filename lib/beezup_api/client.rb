require 'cgi'
require 'logger'

module BeezupApi
  class Client
    include Helpers::Request
    include Api::QueryHelpers


    attr_accessor :consumer_user_id, :consumer_primary_token, :consumer_options,
      :debug, :logger

    def initialize(uid=BeezupApi.user_id, ptoken=BeezupApi.primary_token, debug=BeezupApi.debug, options={})
      @consumer_user_id = uid
      @consumer_primary_token = ptoken
      @consumer_options = options
      @debug = debug
      if @debug
        @logger = Logger.new(STDOUT)
        @logger.level = Logger::DEBUG
      end
    end

    def orders(options = {})
      OrderList.new(self, options)
    end

    def order(options = {})
      OrderDetail.new(self, options)
    end

    def log(message)
      @logger.info { message } if @debug
    end

  end

end
