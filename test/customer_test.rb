gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'
require 'time'

class CustomerTest < Minitest::Test
  def test_customer_id
    #id,first_name,last_name,created_at,updated_at
    #1,Joey,Ondricka,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC
    attributes = {:id => "1"} 
    customer = Customer.new(attributes)
    assert_equal 1, customer.id
  end

  def test_customer_first_name
    attributes = {:first_name => "Joey"}
    customer = Customer.new(attributes)
    assert_equal "Joey", customer.first_name
  end

  def test_customer_last_name
    attributes = {:last_name => "Smith"}
    customer = Customer.new(attributes)
    assert_equal "Smith", customer.last_name
  end

  def test_created_at
    attributes = {:created_at => "2012-03-27 14:54:59 UTC"}
    customer = Customer.new(attributes)
    assert_equal Time.utc(2012, 3, 27, 14, 54, 59), customer.created_at
  end

  def test_updated_at
    attributes = {:updated_at => "2012-03-27 14:54:59 UTC"}
    customer = Customer.new(attributes)
    assert_equal Time.utc(2012, 3, 27, 14, 54, 59), customer.updated_at
  end
  
end
