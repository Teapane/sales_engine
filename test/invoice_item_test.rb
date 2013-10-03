gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item'
require 'time'
require './lib/sales_engine'

class InvoiceItemTest < Minitest::Test


  #id,item_id,invoice_id,quantity,unit_price,created_at,updated_at
#1,539,1,5,13635,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC

 def setup
    @engine = SalesEngine.new
    @repository = InvoiceItemRepository.new("./data/invoice_items.csv", @engine)
  end

def test_id
    attributes = {:id => "1"}
    invoice = InvoiceItem.new(attributes, @engine)
    assert_equal "1", invoice.id
  end

  def test_invoice_id
    attributes = {:invoice_id => "1"}
    invoice = InvoiceItem.new(attributes, @engine)
    assert_equal "1", invoice.invoice_id
  end

  def test_quantity
    attributes = {:quantity => 5}
    invoice = InvoiceItem.new(attributes, @engine)
    assert_equal 5, invoice.quantity
  end

  def unit_price
    attributes = {:unit_price => "5"}
    invoice = InvoiceItem.new(attributes, @engine)
    assert_equal "5", invoice.unit_price
  end

  def test_created_at 
    attributes = {:created_at => "2012-03-25 09:54:09 UTC"}
    invoice = InvoiceItem.new(attributes, @engine)
    assert_equal Time.utc(2012, 3, 25, 9, 54, 9), invoice.created_at
  end

  def test_updated_at
    attributes = {:updated_at => "2012-03-25 09:54:09 UTC"}
    invoice = InvoiceItem.new(attributes, @engine)
    assert_equal Time.utc(2012, 3, 25, 9, 54, 9), invoice.updated_at
  end


end

