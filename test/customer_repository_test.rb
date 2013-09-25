require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'time'
require './lib/customer'
require './lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  def repo
    @repo ||= CustomerRepository.new("./test/fixtures/customers.csv")
  end

  def test_csv_filename
    assert_equal "./test/fixtures/customers.csv", repo.filename
  end

  def test_id
    assert_equal 1, repo.find_id(1).id
  end

  def test_find_all_first_name
    assert_equal 2, repo.all.count
  end

  def test_find_by_first_name
    assert_equal 1, repo.first_name("Joey").count
  end

  def test_find_by_last_name
    assert_equal 1, repo.last_name("Ondricka").count
  end
  def test_if_random
  results = []
    12.times do 
      results << repo.random
    end
    assert (results.uniq.count > 1)
   end


end
