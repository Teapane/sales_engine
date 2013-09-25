gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchants'
require 'time'


class MerchantsTest < Minitest::Test

#   id,name,created_at,updated_at
# 1,Schroeder-Jerde,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC

  def test_merchant_id
    attributes = {:id => "1"}
    merchants = Merchants.new(attributes)
    assert_equal 1, merchants.id
  end

  def test_merchant_name
    attributes = {:name => "Schroeder-Jerde"}
    merchants = Merchants.new(attributes)
    assert_equal "Schroeder-Jerde", merchants.name
  end

  def test_created_at
    attributes = {:created_at => "2012-03-27 14:53:59 UTC"}
    merchants = Merchants.new(attributes)
    assert_equal Time.utc(2012, 3, 27, 14, 53, 59), merchants.created_at
  end

  def test_updated_at
    attributes = {:updated_at => "2012-03-27 14:53:59 UTC"}
    merchants = Merchants.new(attributes)
    assert_equal Time.utc(2012, 3, 27, 14, 53, 59), merchants.updated_at
  end

end
