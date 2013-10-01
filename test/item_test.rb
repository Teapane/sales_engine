require 'time'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'


class ItemTest < Minitest::Test

  def test_has_id
    attributes = {:id => "1"}

    item = Item.new(attributes)
    assert_equal 1, item.id
  end

  def test_item_has_name
    attributes = {:name => "Item test item"}

    item = Item.new(attributes)
    assert_equal "Item test item", item.name
  end

  def test_item_has_description
    attributes = {:description => "this is the description"}

    item = Item.new(attributes)
    assert_equal "this is the description", item.description
  end

  def test_item_has_unit_price
    attributes = {:unit_price => 75333}

    item = Item.new(attributes)
    assert_equal 75333, item.unit_price
  end

  def test_item_has_merchant_id
    attributes = {:merchant_id => "33"}

    item = Item.new(attributes)
    assert_equal 33, item.merchant_id
  end


  def test_created_at
    attributes = {:created_at => "2012-03-27 14:54:59 UTC"}

    item = Item.new(attributes)
    assert_equal Time.utc(2012, 3, 27, 14, 54, 59), item.created_at
  end
  
  def test_updated_at
    attributes = {:updated_at => "2012-04-27 14:54:59 UTC"}

    item = Item.new(attributes)
    assert_equal Time.utc(2012, 4, 27, 14, 54, 59), item.updated_at
  end

end
