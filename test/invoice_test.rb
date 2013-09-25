gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/invoice'
require 'time'

class InvoiceTest < Minitest::Test

# id,customer_id,merchant_id,status,created_at,updated_at
# 1,1,26,shipped,2012-03-25 09:54:09 UTC,2012-03-25 09:54:09 UTC

  def test_id
<<<<<<< HEAD
=======
    skip
>>>>>>> 2a01bbaccb4f7bbea90fffdc9748fd64d1ee8b85
    attributes = {:id => "1"}
    invoice = Invoice.new(attributes)
    assert_equal 1, invoice.id
  end

  def test_customer_id
<<<<<<< HEAD
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
=======
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
>>>>>>> 2a01bbaccb4f7bbea90fffdc9748fd64d1ee8b85
    attributes = {:status => "shipped"}
    invoice = Invoice.new(attributes)
    assert_equal "shipped", invoice.status
  end

<<<<<<< HEAD
  def test_created_at 
=======
  def test_created_at
    skip
>>>>>>> 2a01bbaccb4f7bbea90fffdc9748fd64d1ee8b85
    attributes = {:created_at => "2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(attributes)
    assert_equal Time.utc(2012, 3, 25, 9, 54, 9), invoice.created_at
  end

  def test_updated_at
<<<<<<< HEAD
=======
    skip
>>>>>>> 2a01bbaccb4f7bbea90fffdc9748fd64d1ee8b85
    attributes = {:updated_at => "2012-03-25 09:54:09 UTC"}
    invoice = Invoice.new(attributes)
    assert_equal Time.utc(2012, 3, 25, 9, 54, 9), invoice.updated_at
  end

end
