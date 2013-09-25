require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'time'
require './lib/merchant'
require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

  def repo
    @repo ||= MerchantRepository.new("./test/fixtures/merchants.csv")
  end

  def test_csv_filename
    assert_equal "./test/fixtures/merchants.csv", repo.filename
  end

  def test_load_all_merchants
    assert_equal 2, repo.all.count
  end

  def test_load_by_name
    assert_equal 1, repo.find_name("Schroeder-Jerde").count
  end

  def test_load_by_id
    assert_equal 1, repo.find_id(1).id
  end

def test_random_merchant
    # merchant_one = repo.random
    # merchant_two = repo.random
    # 5.times do
    #   break if merchant_one.id != merchant_two.id
    #   merchant_two = repo.random
    # end
    # refute_equal merchant_one.id, merchant_two.id


    results = []
    12.times do 
      results << repo.random
    end

    assert (results.uniq.count > 1)
  end



end
