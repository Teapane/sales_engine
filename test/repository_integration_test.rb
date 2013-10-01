=begin
require 'minitest'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'
require './lib/merchant_repository'
require './lib/merchant'
require './lib/item'
require './lib/item_repository'

class RepositoryIntegration < Minitest::Test
  def engine
    @engine ||= SalesEngine.new
  end

  def merchant_repo
    @merchant_repo ||= engine.merchant_repository
  end

  def item_repo
    @item_repo ||= engine.item_repository
  end

  def test_a_merchant_finds_associated_items
    merchant_repo.add( Merchant.new(:id => 1))
    merchant = merchant_repo.find_by_id(1)

    3.times do
      item_repo.add( Item.new(:merchant_id => merchant.id) )
    end

    assert_equal 3, merchant.items.count
    merchant.items.each do |item|
      assert_equal merchant.id, item.merchant_id
    end
  end
end
=end
