require 'sinatra/base'
require 'sinatra/json'
require_relative '../services/plaid_service'
require_relative '../models/processed_transactions'

class MainController < Sinatra::Base
  pid = Process.spawn('./node_modules/.bin/webpack-dev-server --port 9090')
  Process.detach(pid)
  puts "webpack pid: #{pid}"

  get "/test" do
    content_type :json
    plaid = PlaidService.new
    client = plaid.get_client
    data = PlaidService.get_transactions(client)
    transactions = ProcessedTransactions.process(data, true)

    json transactions
  end
end