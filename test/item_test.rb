gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/item'
require 'time'

class ItemTest < Minitest::Test

  #id,name,description,unit_price,merchant_id,created_at,updated_at
#1,Item Qui Esse,Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.,75107,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC

def test_item_id
    attributes = {:id => "1"}
    item = Item.new(attributes)
    assert_equal 1, item.id
  end

  def test_item_name
    #skip
    attributes = {:name => "Qui Esse"}
    item = Item.new(attributes)
    assert_equal "Qui Esse", item.name
  end

  def test_description
    #skip
    attributes = {:description => "Nihil autem"}
    item = Item.new(attributes)
    assert_equal "Nihil autem", item.description
  end

  def test_unit_price
    #skip
    attributes = {:unit_price => "75107"}
    item = Item.new(attributes)
    assert_equal "75107", item.unit_price
    end

   def test_merchant_id
    #skip
    attributes = {:merchant_id => "1"}
    item = Item.new(attributes)
    assert_equal 1, item.merchant_id
  end

  def test_created_at
    #skip
    attributes = {:created_at => "2012-03-27 14:53:59 UTC"}
    item = Item.new(attributes)
    assert_equal Time.utc(2012, 3, 27, 14, 53, 59), item.created_at
  end

  def test_updated_at
    #skip
    attributes = {:updated_at => "2012-03-27 14:53:59 UTC"}
    item = Item.new(attributes)
    assert_equal Time.utc(2012, 3, 27, 14, 53, 59), item.updated_at
  end


end
