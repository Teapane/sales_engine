gem 'minitest'
require 'time'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice'
require './lib/sales_engine'

class InvoiceTest < Minitest::Test

  def setup
    @engine = SalesEngine.new
    @repository = InvoiceRepository.new("./data/invoices.csv", @engine)
  end

  #attr_reader :repository

  def test_has_id
    attributes = {:id => "1"}
    invoice = Invoice.new(attributes, @engine)
    assert_equal "1", invoice.id
  end

  def test_has_customer_id
    attributes = {:customer_id => "3"}
    invoice = Invoice.new(attributes, @engine)
    assert_equal "3", invoice.customer_id
  end

  def test_has_merchant_id
    attributes = {:id => "20"}
    invoice = Invoice.new(attributes, @engine)
    assert_equal "20", invoice.id
  end

  def test_has_status
    attributes = {:status => "shipped"}
    invoice = Invoice.new(attributes, @engine)
    assert_equal "shipped", invoice.status
  end

  def test_created_at
    attributes = {:created_at => "2012-03-27 14:54:59 UTC"}
    invoice = Invoice.new(attributes, @engine)
    assert_equal Time.utc(2012, 3, 27, 14, 54, 59), invoice.created_at
  end
  
  def test_updated_at
    attributes = {:updated_at => "2012-04-27 14:54:59 UTC"}

    invoice = Invoice.new(attributes, @engine)
    assert_equal Time.utc(2012, 4, 27, 14, 54, 59), invoice.updated_at
  end

  def test_transaction_relationship
    attributes = {:id => "1"}
    invoice = Invoice.new(attributes, @engine)
    assert_equal 1, invoice.transactions.count
  end

  def test_invoice_item_relationship
    invoice = Invoice.new(:id => "1")
    assert_equal 8, invoice.invoice_items.count
  end

  def test_returns_instance_of_customer_associated_with_this_object
    attributes = {:id => "1"}
    invoice = Invoice.new(attributes)
    assert_equal "joey", invoice.customer.first_name.downcase
  end  

  def test_returns_instance_of_merchant_associated_with_this_object
    attributes = {:id => "1"}
    invoice = Invoice.new(attributes)
    assert_equal "schroeder-jerde", invoice.merchant.name.downcase
  end 



end
