require 'minitest/autorun'

class ClearbitTest < Minitest::Test
  def test_clearbit_exists
    assert Clearbit.new
  end
end