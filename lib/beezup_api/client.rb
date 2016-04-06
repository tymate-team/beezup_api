require 'cgi'

module BeezupApi
  class Client
    include Helpers::Request
    include Api::QueryHelpers


    attr_reader :consumer_user_id, :consumer_primary_token, :consumer_options

    def initialize(uid=BeezupApi.user_id, ptoken=BeezupApi.primary_token, options={})
      @consumer_user_id   = uid
      @consumer_primary_token  = ptoken
      @consumer_options = options
    end

    def orders(options = {})
      OrderList.new(self, options)
    end

    def order(options = {})
      OrderDetail.new(self, options)
    end

  end

end
