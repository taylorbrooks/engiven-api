module EngivenAPI
  class Client
    module Customer
      def list_customers(options = {})
        get('/customers', options)
      end

      def create_customer(options = {})
        post('/customers', options)
      end

      def find_customer(id)
        get("/customers/#{id}")
      end

      def update_customer(id, options = {})
        post("/customers/#{id}", options)
      end

      def upload_logo(id, options)
        post("/customers/#{id}/logo", options)
      end

      def remove_logo(id)
        post("/customers/#{id}/logo")
      end
    end
  end
end
