require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'time'
require '../lib/customer'
require '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  attr_reader :repo
  def setup
    @repo = CustomerRepository.new("./fixtures/customers.csv")
  end

  def test_csv_filename
    repo = CustomerRepository.new("./fixtures/customers.csv")
    assert_equal "./fixtures/customers.csv", repo.filename
    end
end
