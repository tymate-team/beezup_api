module BeezupApi
  module Helpers
    module Request

      protected

        def get(path, params={}, headers={})
          # Unirest.get(url, headers: {}, parameters: nil, auth:nil, &callback)
          log("Get request on #{api_url(path)} \n  Headers: #{default_headers(headers)} \n  Parameters: #{params}")

          response = Unirest.get(
            api_url(path),
            headers: default_headers(headers),
            parameters: params
          )

          raise_errors(response)
          response
        end

        # def post(path, params={}, headers={})
        #   # Unirest.post(url, headers: {}, parameters: nil, auth:nil, &callback)
        #   response = Unirest.post(
        #     api_url(path),
        #     headers: default_headers_post(headers),
        #     parameters: params
        #   )

        #   raise_errors(response)
        #   response
        # end

        # def patch(path, params={}, headers={})
        #   # Unirest.patch(url, headers: {}, parameters: nil, auth:nil, &callback)
        #   response = Unirest.patch(
        #     api_url(path),
        #     headers: default_headers(headers),
        #     parameters: params
        #   )

        #   raise_errors(response)
        #   response
        # end

        # def options(path, params={}, headers={})
        # end

      private

        # Use application/json to improve performance
        def default_headers(options)
          {
            'Accept' => 'application/json',
            'Ocp-Apim-Subscription-Key' => @consumer_primary_token
          }.merge(options)
        end

        def default_headers_post(options)
          {
            'Content-Type' => 'application/json',
          }.merge(default_headers(options))
        end

        # Returns `path` concatenated to `based_url`.
        def api_url(path)
          "#{base_url}orders/v1/#{@consumer_user_id}#{path}"
        end

        # Returns the Beezup API base url.
        def base_url
          "https://api.beezup.com/"
        end

        def raise_errors(response)
          case response.code
          when 401
            data = Mash.from_json(response.body)
            raise BeezupApi::Errors::UnauthorizedError.new(data), data.inspect
          when 400
            data = Mash.from_json(response.body)
            raise BeezupApi::Errors::GeneralError.new(data), data.inspect
          when 403
            data = Mash.from_json(response.body)
            raise BeezupApi::Errors::AccessDeniedError.new(data), data.inspect
          when 404
            raise BeezupApi::Errors::NotFoundError, "(#{response.code}): #{response.body}"
          when 429
            raise BeezupApi::Errors::RateLimitError, "(#{response.code}): #{response.body}"
          when 500
            raise BeezupApi::Errors::InformBeezupError, "BeezupApi had an internal error. Please let them know in the forum. (#{response.code}): #{response.body}"
          when 502..503
            raise BeezupApi::Errors::UnavailableError, "(#{response.code}): #{response.body}"
          end
        end


        # Stolen from Rack::Util.build_query
        def to_query(params)
          params.map { |k, v|
            if v.class == Array
              to_query(v.map { |x| [k, x] })
            else
              v.nil? ? escape(k) : "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"
            end
          }.join("&")
        end

        # def to_uri(path, options)
        #   uri = URI.parse(path)

        #   if options && options != {}
        #     uri.query = to_query(options)
        #   end
        #   uri.to_s
        # end
    end

  end
end
