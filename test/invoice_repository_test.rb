=begin
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'time'
require './lib/invoice'
require './lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def repo
    @repo ||= InvoiceRepository.new("./test/fixtures/invoices.csv")
  end

  def test_csv_filename
    #skip
    assert_equal "./test/fixtures/invoices.csv", repo.filename
  end

  def test_id
    assert_equal 1, repo.find_id(1).id
  end

end
=end
