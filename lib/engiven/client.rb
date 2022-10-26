require 'faraday'

require 'engiven/version'
require 'engiven/error'
require 'engiven/resources/customer'
require 'engiven/resources/fund'
require 'engiven/resources/gift'
require 'engiven/resources/misc'

module EngivenAPI
  class Client
    include EngivenAPI::Client::Customer
    include EngivenAPI::Client::Fund
    include EngivenAPI::Client::Gift
    include EngivenAPI::Client::Misc

    attr_reader :api_key, :test_mode, :logger, :connection, :adapter, :ssl

    def initialize(api_key:, test_mode: false, logger: true, adapter: Faraday.default_adapter, ssl: nil)
      @api_key = api_key
      @test_mode = test_mode
      @logger = logger
      @adapter = adapter
    end

    def delete(path, options = {})
      connection.delete(path, options).body
    end

    def get(path, options = {})
      connection.get(path, options).body
    end

    def post(path, options = {})
      connection.post(path, options).body
    end

    private

    def url
      return 'https://api.sandbox.engiven.com' if test_mode

      'https://api.engiven.com'
    end

    def connection
      headers = {
        accept: 'application/json',
        'Authorization' => api_key,
        'User-Agent' => "engiven-api-ruby-gem/v#{EngivenAPI::VERSION}"
      }

      client_opts = {
        url: url,
        headers: headers
      }

      client_opts[:ssl] = ssl if ssl

      Faraday.new(client_opts) do |conn|
        conn.request  :json
        conn.response :logger if logger
        conn.response :engiven_error_handler
        conn.response :json
        conn.adapter  adapter
      end
    end
  end
end
