require 'csv'
require './lib/invoice'
require './lib/invoice_repository'
require 'time'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class InvoiceRepositoryTest < Minitest::Test

  attr_reader :repo
  
  def setup
    @repo ||= InvoiceRepository.new("./test/fixtures/invoices.csv")
  end

  def test_csv_filename
    assert_equal "./test/fixtures/invoices.csv", repo.filename
  end

  def test_load_all_invoices
    assert_equal 2, repo.all.count
  end

  def test_load_by_customer_id
    assert_equal 0, repo.find_customer_id('1').count
  end

  def test_load_by_merchant_id
    assert_equal 0, repo.find_merchant_id('26').count
  end

  def test_load_by_transaction_id
    assert_equal 0, repo.find_id(3).count
  end

  def test_load_by_status
    assert_equal 2, repo.find_status('shipped').count
  end
end
