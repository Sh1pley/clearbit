require 'minitest/autorun'
require 'minitest/pride'

require "test_helper"

class ClearbitTest < Minitest::Test
  def test_clearbit_exists
    assert Clearbit.new
  end
end