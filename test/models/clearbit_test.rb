require 'minitest/autorun'
require 'minitest/pride'

require "test_helper"

class ClearbitTest < Minitest::Test
  def test_clearbit_exists
    assert ClearbitService.new
  end

  def test_clearbit_can_access_domain_info
    cb = ClearbitService.new
    info = cb.get_domain('Clearbit')

    refute info.nil?
    assert_equal info.name, "Clearbit"
    assert_equal info.domain, "clearbit.com"
  end
end