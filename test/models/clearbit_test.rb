require 'minitest/autorun'
require 'minitest/pride'

require "test_helper"

class ClearbitTest < Minitest::Test
  def test_clearbit_exists
    assert Clearbit.new
  end

  def test_clearbit_can_access_domain_info
    cb = Clearbit.new
    info = cb.get_domain('Clearbit')

    refute info.nil?
  end
end