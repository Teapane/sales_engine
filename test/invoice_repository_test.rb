require 'csv'
require './lib/invoice'
require './lib/invoice_repository'
require 'time'
gem     'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test

 

  def repo
    engine = SalesEngine.new
    @repo ||= InvoiceRepository.new("./data/invoices.csv", engine)
  end

  def test_csv_filename
    assert_equal "./data/invoices.csv", repo.filename
  end

  def test_find_all_invoices
    assert_equal 4843, repo.all.count
  end


  def test_find_by_customer_id
    assert_equal "1", repo.find_by_customer_id('1').customer_id
  end
  

  def test_find_by_merchant_id
    assert_equal "26", repo.find_by_merchant_id('26').merchant_id
  end


  def test_find_by_status
    assert_equal "shipped", repo.find_by_status('shipped').status
  end
end
