require "test_helper"

class ProcessedTransactionsTest < Minitest::Test

  def test_transaction_has_details
    plaid = PlaidService.new
    client = plaid.get_client
    data = PlaidService.get_transactions(client)
    transactions = ProcessedTransactions.process(data)
    
    assert transactions[0].name != nil
    assert transactions[0].domain != nil
    assert transactions[0].transactions != nil
    assert transactions[0].recurring != nil
  end

  def test_recurring_returns_bool
    plaid = PlaidService.new
    client = plaid.get_client
    data = PlaidService.get_transactions(client)
    transactions = ProcessedTransactions.process(data)

    results = transactions.map {|t| t.recurring}
   
    assert results.include? true
    assert results.include? false
  end

end