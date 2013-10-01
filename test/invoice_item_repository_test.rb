gem 'minitest'
require 'csv'
require 'minitest/autorun'
require 'minitest/pride'
require 'time'
require './lib/invoice_item_repository'
require './lib/invoice_item'
require './lib/sales_engine'

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :repo

 def repo
    engine = SalesEngine.new
    @repo ||= engine.invoice_item_repository
  end

  def test_csv_filename
    assert_equal "./data/invoice_items.csv", repo.filename
  end

  def test_load_all_invoice_items
    assert_equal 21687, repo.all.count
  end

  def test_find_all_by_item_id
    assert_equal 7, repo.find_all_by_item_id(539).count
  end

  def test_find_by_invoice_id
    assert_equal 62, repo.find_by_invoice_id(13).id
  end

  def test_find_by_item_quantity
    skip
    assert_equal 1, repo.find_by_item_quantity(5).count
  end

  def test_find_by_unit_price
    skip
    assert_equal 1, repo.find_by_unit_price(13635).count
  end
end
