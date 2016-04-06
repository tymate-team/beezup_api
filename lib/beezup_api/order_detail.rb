require 'hashie'

module BeezupApi

  class OrderDetail
    include Helpers::Request
    include Api::QueryHelpers

    attr_accessor :client, :options,
      :request, :info

    def initialize(client, options)
      @client = client
      @options = options
    end

    def detail(query_options = {})
      call_api(query_options)
    end

    private

      def call_api(query_options)
        response = client.order_query(query_options.merge(@options))

        set_result(response)
      end

      def set_result(response)
        body = Hashie::Mash.new response.body

        @request = body.request
        @info = body.info

        body.result
      end
  end
end
