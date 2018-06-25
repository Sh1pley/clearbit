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
      
      builder.options[:timeout] = 60*10
    end

    return plaid_client
  end

  def self.get_transactions(client)
    response = get_all_transactions(client)
    total = response.total_transactions
    transactions = response.transactions
    while transactions.count < total do 
      resp = get_all_transactions(client, transactions.count)
      transactions += resp.transactions
    end
    return {transactions: transactions, total: response.total_transactions}
  end

  private
  def self.get_all_transactions(client, offset = 0)
    client.transactions.get(ENV['PLAID_ACCESS_TOKEN'], '2016-07-12', '2017-01-09', offset: offset)
  end
end