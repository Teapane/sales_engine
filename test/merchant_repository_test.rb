require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'time'
require './lib/merchant'
require './lib/merchant_repository'
require './lib/sales_engine'

class MerchantRepositoryTest < Minitest::Test

 def repo
    engine = SalesEngine.new
    @repo ||= engine.merchant_repository
  end

  def test_csv_filename
    assert_equal "./data/merchants.csv", repo.filename
  end

  def test_load_all_merchants
    assert_equal 100, repo.all.count
  end

  def test_find_all_by_name
    assert_equal 1, repo.find_all_by_name("Schroeder-Jerde").count
  end

   def test_find_by_name
    assert_equal "Schroeder-Jerde", repo.find_by_name("Schroeder-Jerde").name
  end

  def test_find_by_id
    assert_equal 1, repo.find_by_id(1).id
  end

def test_random_merchant
    results = []
    12.times do 
      results << repo.random
    end

    assert (results.uniq.count > 1)
  end



end
