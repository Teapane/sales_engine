require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'Sales_Engine.rb'
require 'csv'


class SalesEngineTest < MiniTest::Unit::TestCase

  test_it_does_load_csv_file_data
  salesengine = SalesEngine.new
  assert_equal "hey"
  end

