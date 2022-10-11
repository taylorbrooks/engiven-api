module EngivenAPI
  class Client
    module Gift
      def list_gifts(options = {})
        get('/gifts', options)
      end

      def create_pledged_gift(options = {})
        post('/gifts', options)
      end
    end
  end
end
