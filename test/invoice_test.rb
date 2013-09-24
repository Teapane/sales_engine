gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/invoice'
require 'time'

class InvoiceTest < Minitest::Test

# id,customer_id,merchant_id,status,created_at,updated_at
# 1,1,26,shipped,2012-03-25 09:54:09 UTC,2012-03-25 09:54:09 UTC

  def test_id
    attributes = {:id => "1"}
    invoice = Invoice.new(attributes)
    assert_equal 1, invoice.id
  end

  def test_customer_id
    attributes = {:customer_id => "1"}
    invoice = Invoice.new(attributes)
    assert_equal 1, invoice.customer_id
  end

  def test_merchant_id
    attributes = {:merchant_id => "26"}
    invoice = Invoice.new(attributes)
    assert_equal 26, invoice.merchant_id
  end

  def test_status
    attributes = {:status => "shipped"}
    invoice = Invoice.new(attributes)
    assert_equal "shipped", invoice.status
  end

  def test_created_at 
    attributes = {:created_at => "2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(attributes)
    assert_equal Time.utc(2012, 3, 25, 9, 54, 9), invoice.created_at
  end

  def test_updated_at
    attributes = {:updated_at => "2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(attributes)
    assert_equal Time.utc(2012, 3, 25, 9, 54, 9), invoice.updated_at
  end

end