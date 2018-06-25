require 'sinatra/base'
require 'sinatra/json'
require_relative '../services/plaid_service'
require_relative '../models/processed_transactions'

class MainController < Sinatra::Application
  get "/test-transactions" do
    content_type :json
    plaid = PlaidService.new
    client = plaid.get_client
    data = PlaidService.get_transactions(client)
    transactions = ProcessedTransactions.process(data)

    json transactions
  end
end