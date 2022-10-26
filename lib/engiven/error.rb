module EngivenAPI
  class Error < StandardError; end
  class BadGateway < Error; end
  class BadRequest < Error; end
  class CloudflareError < Error; end
  class Forbidden < Error; end
  class GatewayTimeout < Error; end
  class InternalServerError < Error; end
  class NotFound < Error; end
  class ServiceUnavailable < Error; end
  class Unauthorized < Error; end
end

module Faraday
  class Response
    class EngivenErrorMiddleware < Middleware
      ERROR_STATUSES = 400..600
      def on_complete(env)
        case env[:status]
        when 400
          raise EngivenAPI::BadRequest, error_message(env)
        when 401
          raise EngivenAPI::Unauthorized, error_message(env)
        when 403
          raise EngivenAPI::Forbidden, error_message(env)
        when 404
          raise EngivenAPI::NotFound, error_message(env)
        when 500
          raise EngivenAPI::InternalServerError, error_message(env)
        when 502
          raise EngivenAPI::BadGateway, error_message(env)
        when 503
          raise EngivenAPI::ServiceUnavailable, error_message(env)
        when 504
          raise EngivenAPI::GatewayTimeout, error_message(env)
        when 520
          raise EngivenAPI::CloudflareError, error_message(env)
        when ERROR_STATUSES
          raise EngivenAPI::Error, error_message(env)
        end
      end

      private

      def error_message(env)
        "#{env[:status]}: #{env[:url]} #{env[:body]}"
      end
    end
  end
end


Faraday::Response.register_middleware(engiven_error_handler: Faraday::Response::EngivenErrorMiddleware)
