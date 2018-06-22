require 'plaid'
require 'dotenv'
Dotenv.load

class PlaidService

  def get_client
    plaid_client = Plaid::Client.new(env: ENV['PLAID_ENV'],
                                              client_id: ENV['PLAID_CLIENT_ID'],
                                              secret: ENV['PLAID_SECRET'],
                                              public_key: ENV['PLAID_PUBLIC_KEY']) do |builder|
      Plaid::Client.build_default_connection(builder)
      # Increase network timeout
      builder.options[:timeout] = 60*20    # 20 minutes
    end

    return plaid_client
  end

  def self.get_transactions(client)
    response = client.transactions.get(ENV['PLAID_ACCESS_TOKEN'], '2016-07-12', '2017-01-09')
    return response
  end
end