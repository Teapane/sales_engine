gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'
require 'time'
require './lib/sales_engine'


class MerchantTest < Minitest::Test

#   id,name,created_at,updated_at
# 1,Schroeder-Jerde,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC

 def setup
    @engine = SalesEngine.new
    @repository = MerchantRepository.new("./data/merchants.csv", @engine)
  end

  def test_merchant_id
    attributes = {:id => "1"}
    merchant = Merchant.new(attributes, @engine)
    assert_equal "1", merchant.id
  end

  def test_merchant_name
    attributes = {:name => "Schroeder-Jerde"}
    merchant = Merchant.new(attributes, @engine)
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_created_at
    attributes = {:created_at => "2012-03-27 14:53:59 UTC"}
    merchant = Merchant.new(attributes, @engine)
    assert_equal Time.utc(2012, 3, 27, 14, 53, 59), merchant.created_at
  end

  def test_updated_at
    attributes = {:updated_at => "2012-03-27 14:53:59 UTC"}
    merchant = Merchant.new(attributes, @engine)
    assert_equal Time.utc(2012, 3, 27, 14, 53, 59), merchant.updated_at
  end

 #def test_that_a_merchant_can_find_its_items
  #  merchant = Merchant.new(:id => "1")
   # assert_equal , merchant.items.count
  #end

  


end
