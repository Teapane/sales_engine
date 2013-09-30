require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'time'
require './lib/transaction'
require './lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def repo
    @repo ||= TransactionRepository.new("./test/fixtures/transactions.csv")
  end

  def def test_csv_filename
    assert_equal "./test/fixtures/transactions.csv", repo.filename
  end

  def test_id
    assert_equal 1, repo.find_id(1).id
  end

  def test_invoice_id
    assert_equal 1, repo.find_invoice_id(1).id
  end

  #def test_credit_card_number
    #assert_equal 1, repo.find_credit_card_number(4654405418249632).count
  #end

  #def test_for_result
    #assert_equal success, repo.find_result("success")
  #end

end
