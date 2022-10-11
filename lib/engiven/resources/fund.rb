module EngivenAPI
  class Client
    module Fund
      def list_funds(options = {})
        get('/funds', options)
      end

      def create_fund(options = {})
        post('/funds', options)
      end

      def find_fund(id)
        get("/funds/#{id}")
      end

      def update_fund(id, options = {})
        post("/funds/#{id}", options)
      end
    end
  end
end
