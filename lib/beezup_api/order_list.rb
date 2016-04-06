require 'hashie'

module BeezupApi

  class OrderList
    include Helpers::Request
    include Api::QueryHelpers

    attr_accessor :client, :options,
      :pagination_result, :request, :info,
      :count

    def initialize(client, options)
      @client = client
      @options = options
      @count = 0
    end

    def all(query_options={})
      query_options[:pageNumber] = 1
      results = call_api(query_options)

      Enumerator.new do |yielder|
        loop do

          if (@pagination_result.totalNumberOfPages == query_options[:pageNumber]) || results.orderHeaders.nil?
            raise StopIteration
          end

          query_options[:pageNumber] += 1
          results.orderHeaders.each do |entry|
            @count += 1
            yielder.yield entry
          end
          results = call_api(query_options)
        end
      end
    end

    private

      def call_api(query_options)
        response = client.simple_query('', query_options.merge(@options))

        set_result(response)
      end

      def set_result(response)
        body = Hashie::Mash.new response.body

        @pagination_result = body.result.paginationResult
        @request = body.request
        @info = body.info

        body.result
      end
  end
end
