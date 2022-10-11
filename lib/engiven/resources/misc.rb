module EngivenAPI
  class Client
    module Misc
      def get_supported_crypto
        get('/get-supported-crypto')
      end

      def get_pricefeed
        get('/get-supported-crypto-pricefeed')
      end
    end
  end
end
