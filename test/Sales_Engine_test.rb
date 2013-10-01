gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require 'pry'

require "./lib/sales_engine"

class SalesEngineTest < Minitest::Test

  attr_reader :sales_engine
  
  def setup
    @sales_engine = SalesEngine.new("./test/fixtures")
    @sales_engine.startup
  end

  def test_it_loads_customer_repository
    assert_kind_of CustomerRepository, sales_engine.customer_repository
  end 

  def test_it_loads_invoice_item_repository
    assert_kind_of InvoiceItemRepository, sales_engine.invoice_item_repository
  end

  def test_it_loads_invoice_repository
    assert_kind_of InvoiceRepository, sales_engine.invoice_repository
  end

  def test_it_loads_item_repository
    assert_kind_of ItemRepository, sales_engine.item_repository
  end

  def test_it_loads_merchant_repository
    assert_kind_of MerchantRepository, sales_engine.merchant_repository
  end

  def test_it_loads_transaction_repository
    assert_kind_of TransactionRepository, sales_engine.transaction_repository
  end
end

  
