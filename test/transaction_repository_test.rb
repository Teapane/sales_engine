gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction'
require './lib/transaction_repository'
require './lib/sales_engine'

class TransactionRepositoryTest < Minitest::Test

attr_reader :repo,
:engine

def setup
    @engine = SalesEngine.new
    @repo ||= TransactionRepository.new("./data/transactions.csv", engine)
  end

  def test_csv_filename
    assert_equal "./data/transactions.csv", repo.filename
  end

  def test_find_all_transactions
    assert_equal 5595, repo.all.count
  end

  def test_find_by_id
    assert_equal "1", repo.find_by_id("1").id
  end

  def test_find_by_invoice_id
    assert_equal "4", repo.find_by_invoice_id("4").invoice_id
  end

  def test_find_by_credit_card_number
    assert_equal "4654405418249632", repo.find_by_card_number("4654405418249632").credit_card_number
  end
    
  def test_find_by_result
    assert_equal "success", repo.find_by_result("success").result
  end

  def test_find_all_by_id
    assert_equal 1, repo.find_all_by_id("1").count
  end

  def test_find_all_by_invoice_id
    assert_equal 1, repo.find_all_by_invoice_id("4").count
  end

  def test_find_all_by_credit_card_number
    assert_equal 1, repo.find_all_by_card_number("4654405418249632").count
  end
    
  def test_find_all_by_result
    assert_equal 4648, repo.find_all_by_result("success").count
  end

end
