require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'time'
require '../lib/merchant'
require '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

  attr_reader :repo
  def setup
    @repo = MerchantRepository.new("./fixtures/merchants.csv")
  end

  def test_csv_filename

    repo = MerchantRepository.new("./fixtures/merchants.csv")
    assert_equal "./fixtures/merchants.csv", repo.filename
  end

  def test_load_all_merchants
    
    repo = MerchantRepository.new("./fixtures/merchants.csv")
    assert_equal 2, repo.all.count
  end

  def test_load_by_name
    repo = MerchantRepository.new("./fixtures/merchants.csv")
    assert_equal 1, repo.find_name("Schroeder-Jerde").count
  end

  def test_load_by_id
    repo = MerchantRepository.new("./fixtures/merchants.csv")
    assert_equal 1, repo.find_id(1).count
  end

def test_random_merchant
    merchant_one = repo.random
    merchant_two = repo.random
    5.times do
      break if merchant_one.id != merchant_two.id
      merchant_two = repo.random
    end
    refute_equal merchant_one.id, merchant_two.id
  end



end
