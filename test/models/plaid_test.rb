require 'test_helper'

class PlaidTest < Minitest::Test
  def test_plaid_service_exists
    assert PlaidService.new
  end

  def test_plaid_can_return_client
    plaid = PlaidService.new
    client = plaid.get_client

    refute client.nil?
    assert_equal client.class, Plaid::Client
  end

  def test_plaid_client_has_transactions
    plaid = PlaidService.new
    client = plaid.get_client
    transactions = PlaidService.get_transactions(client)

    refute transactions.empty?
  end
end