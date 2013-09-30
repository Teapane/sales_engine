gem 'minitest'
require 'csv'
require 'minitest/autorun'
require 'minitest/pride'
require 'time'
require './lib/item_repository'
require './lib/item'

class ItemRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    @repo ||= ItemRepository.new("./test/fixtures/items.csv")
  end

  def test_csv_filename
    assert_equal "./test/fixtures/items.csv", repo.filename
  end

  def test_load_all_items
    assert_equal 1, repo.all.count
  end

  def test_load_by_item_id
    assert_equal 1, repo.find_id(1).count
  end

  def test_load_by_invoice_id
    assert_equal 1, repo.find_name("Item Qui Esse").count
  end

  def test_it_has_description
    assert_equal 1, repo.find_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").count 
  end
    
  def test_load_by_unit_price
    assert_equal 0, repo.find_unit_price(75107).count
  end

  def test_load_by_merchant_id
    assert_equal 1, repo.find_merchant_id(1).count
  end

end
