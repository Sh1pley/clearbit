require 'test_helper'

class PlaidTest < Minitest::Test
  def test_plaid_service_exists
    assert PlaidService.new
  end
end