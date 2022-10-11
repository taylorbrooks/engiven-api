# engiven-api
A Ruby wrapper for the Engiven.com API

Learn about the Engiven API at https://apidocs.engiven.com

### Installation
Add this line to your application's Gemfile:
````ruby
  # in your Gemfile
  gem 'engiven', '~> 0.0.1'

  # then...
  bundle install
````

### Usage
````ruby
  client = EngivenAPI::Client.new(api_key: {{ api_key }})

  # List Customers
  client.list_customers(params)

  # Create a Customer
  client.create_customer(params)

  # Find a Customer
  client.find_customer(id)

  # Update a Customer
  client.update_customer(id, params)

  # List Funds
  client.list_funds(params)

  # Create a Fund
  client.create_fund(params)

  # Find a Fund
  client.find_fund(id)

  # Update a Fund
  client.update_fund(id, params)

  # List Gifts
  client.list_gifts(params)

  # Create a Pledged Gift
  client.create_pledged_gift(params)
````
