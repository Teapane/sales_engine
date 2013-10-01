gem 'minitest'
#require 'csv'
require 'minitest/autorun'
require 'minitest/pride'
#require 'time'
#require './lib/item_repository'
#require './lib/item'
#require './lib/sales_engine'

class ItemRepositoryTest < Minitest::Test
  attr_reader :repo

  def repo
    engine = SalesEngine.new
    @repo ||= engine.item_repository
  end

  def test_csv_filename
    assert_equal "./data/items.csv", repo.filename
  end

  def test_load_all_items
    assert_equal 2483, repo.all.count
  end

  def test_find_by_id
    assert_equal 1, repo.find_by_id(1).id
  end


  def test_it_has_description
    skip
    assert_equal 1, repo.find_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").count 
  end
    
  def test_find_by_unit_price
    skip
    assert_equal 0, repo.find_by_unit_price("0")
  end

  def test_load_by_merchant_id
    skip
    assert_equal 1, repo.find_merchant_id(1).count
  end

end
