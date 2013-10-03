=begin
 attr_reader :id,
  :first_name,
  :last_name,
  :created_at,
  :updated_at,


  def initialize(data)
    @id = data.["id"].to_i
    @first_name = data.["first_name"]
    @last_name = data.["last_name"]
    @created_at = data.parse(data["created_at"])
    @updated_at = data.parse(data["updated_at"])
  end

end


def test_it_loads_invoice_item_repository
    skip
    invoice_item_repository = InvoiceItemRepository.new
    assert_kind_of invoice_item_repository.class, sales_engine.invoice_item_repository
  end 

  def test_it_loads_invoice_repository
    skip
    invoice_repository = InvoiceRepository.new
    assert_kind_of invoice_repository.class, sales_engine.invoice_repository
  end 

  def test_it_loads_item_repository
    skip
    item_repository = ItemRepository.new
    assert_kind_of item_repository.class, sales_engine.item_repository
  end 

  def test_it_loads_merchant_repository
    skip
    merchant_repository = MerchantRepository.new
    assert_kind_of merchant_repository.class, sales_engine.merchant_repository
  end 

  def test_it_loads_transaction_repository
    skip
    transaction_repository = TransactionRepository.new
    assert_kind_of transaction_repository.class, sales_engine.transaction_repository
  end 

end


class InvoiceTest < Minitest::Test

# id,customer_id,merchant_id,status,created_at,updated_at
# 1,1,26,shipped,2012-03-25 09:54:09 UTC,2012-03-25 09:54:09 UTC
  attr_reader :repository

  def setup
    @engine = SalesEngine.new
    @repository = InvoiceRepository.new(@engine, "./data/invoices.csv")
  end

  def test_id
    skip
    attributes = {:id => "1"}
    invoice = Invoice.new(attributes)
    assert_equal 1, invoice.id
  end

  def test_customer_id
    skip
    attributes = {:customer_id => "1"}
    invoice = Invoice.new(attributes)
    assert_equal 1, invoice.customer_id
  end

  def test_merchant_id
    skip
    attributes = {:merchant_id => "26"}
    invoice = Invoice.new(attributes)
    assert_equal 26, invoice.merchant_id
  end

  def test_status
    skip
    attributes = {:customer_id => "1"}
    invoice = Invoice.new(attributes)
    assert_equal 1, invoice.customer.id
  end

  def test_merchant_id
    skip
    attributes = {:merchant_id => "26"}
    invoice = Invoice.new(attributes)
    assert_equal 26, invoice.merchant.id
  end

  def test_status
    skip
    attributes = {:status => "shipped"}
    invoice = Invoice.new(attributes)
    assert_equal "shipped", invoice.status
  end

  def test_created_at
    skip
    attributes = {:created_at => "2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(attributes)
    assert_equal Time.utc(2012, 3, 25, 9, 54, 9), invoice.created_at
  end

  def test_updated_at
    skip
    attributes = {:updated_at => "2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(attributes)
    assert_equal Time.utc(2012, 3, 25, 9, 54, 9), invoice.updated_at
  end

  def test_transactions_relationship
     attributes = {:id => 1}
     invoice = Invoice.new(attributes, repository)
     assert_equal 1, invoice.transactions.count
  end


end
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

