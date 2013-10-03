require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'time'
require './lib/customer'
require './lib/customer_repository'
require './lib/sales_engine'

class CustomerRepositoryTest < Minitest::Test

  def repo
    engine = SalesEngine.new
    @repo ||= engine.customer_repository
  end

  def test_csv_filename
    assert_equal "./data/customers.csv", repo.filename
  end

  def test_find_by_id
    assert_equal "1", repo.find_by_id("1").id
  end

  def test_find_all_by_first_name 
    assert_equal 1, repo.find_all_by_first_name("Joey").count
  end

  def test_find_by_first_name
    assert_equal "Joey", repo.find_by_first_name("Joey").first_name
  end

  def test_find_by_last_name
    assert_equal "Ondricka", repo.find_by_last_name("Ondricka").last_name
  end

  def test_find_all_by_last_name
    assert_equal 3, repo.find_all_by_last_name("Ondricka").count
  end

  def test_if_random
    
  results = []
    12.times do 
      results << repo.random
    end
    assert (results.uniq.count > 1)
   end


end
