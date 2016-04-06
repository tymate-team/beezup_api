module BeezupApi
  module Errors
    class BeezupApiError < StandardError
      attr_reader :data
      def initialize(data)
        @data = data
        super
      end
    end

    # Raised when a 401 response status code is received
    class UnauthorizedError      < BeezupApiError; end

    # Raised when a 400 response status code is received
    class GeneralError           < BeezupApiError; end

    # Raised when a 403 response status code is received
    class AccessDeniedError      < BeezupApiError; end

    # Raised when a 404 response status code is received
    class NotFoundError          < StandardError; end

    # Raised when a 429 response status code is received
    # (Exceed the rate limit)
    class RateLimitError    < StandardError; end

    # Raised when a 500 response status code is received
    class InformBeezupError    < StandardError; end

    # Raised when a 502 or 503 response status code is received
    class UnavailableError       < StandardError; end
  end
end
