gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/transactions'
require 'time'

class TransactionTest < Minitest::Test

#   id,invoice_id,credit_card_number,credit_card_expiration_date,result,created_at,updated_at
# 1,1,4654405418249632,,success,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC

def test_id
  attributes = {:id => "1"}
  transaction = Transaction.new(attributes)
  assert_equal 1, transaction.id
end

def test_invoice_id
  attributes = {:invoice_id => "1"}
  transaction = Transaction.new(attributes)
  assert_equal 1, transaction.invoice_id
end

def test_credit_card_number
  attributes = {:credit_card_number => "4654405418249632"}
  transaction = Transaction.new(attributes)
  assert_equal 4654405418249632, transaction.credit_card_number
end

def test_credit_card_expiration
  attributes = {:credit_card_expiration => nil}
  transaction = Transaction.new(attributes)
  assert_equal nil, transaction.credit_card_expiration
end

def test_result
  attributes = {:result => "success"}
  transaction = Transaction.new(attributes)
  assert_equal "success", transaction.result
end

def test_created_at
    attributes = {:created_at => "2012-03-27 14:54:09 UTC"}
    transaction = Transaction.new(attributes)
    assert_equal Time.utc(2012, 3, 27, 14, 54, 9), transaction.created_at
  end

  def test_updated_at
    #skip
    attributes = {:updated_at => "2012-03-27 14:54:09 UTC"}
    transaction = Transaction.new(attributes)
    assert_equal Time.utc(2012, 3, 27, 14, 54, 9), transaction.updated_at
  end

end
