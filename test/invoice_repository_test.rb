require 'csv'
require './lib/invoice'
require './lib/invoice_repository'
require 'time'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test

  attr_reader :repo
  
  def repo
    engine = SalesEngine.new
    @repo ||= engine.invoice_repository
  end

  def test_csv_filename
    assert_equal "./data/invoices.csv", repo.filename
  end

  def test_load_all_invoices
    assert_equal 4843, repo.all.count
  end

  def test_find_by_customer_id
    assert_equal 1, repo.find_by_customer_id('1').id
  end

  def test_find_all_by_customer_id
    assert_equal 8, repo.find_all_by_customer_id('1').count
  end

  def test_find_by_merchant_id
    assert_equal 1, repo.find_by_merchant_id('26').id
  end

  def test_find_all_by_merchant_id
    assert_equal 59, repo.find_all_by_merchant_id('1').count
  end

  def test_find_by_transaction_id
    assert_equal 3, repo.find_by_transaction_id(3).id
  end

  def test_find_all_by_transaction_id
    assert_equal 1, repo.find_all_by_transaction_id(3).count
  end

  def test_load_by_status
    assert_equal 4843, repo.find_status('shipped').count
  end
end
