require 'csv'

class ItemRepository
  attr_reader :filename,
  :engine

  def initialize(filename, engine)
    @filename = filename
    @engine = engine
  end

  def all
    @all ||= build_items
  end

  def random
    all.sample
  end

  def find_by_id(id)
    all.find { |item| item.id.to_i == id.to_i }
  end

  def find_by_name(name)
    all.find { |item| item.name == name}
  end

  def find_by_description(description)
    all.find { |item| item.description == description}
  end

  def find_by_unit_price(price)
    all.find { |item| item.unit_price == price}
  end

  def find_by_merchant_id(merchant)
    all.find { |item| item.merchant_id == merchant}
  end
  
  def find_all_by_id(id)
    all.select { |item| item.id.to_i == id.to_i }
  end 

  def find_all_by_name(name)
    all.select { |item| item.name == name }
  end

  def find_all_by_description(description)
    all.select { |item| item.description == description}
  end

  def find_all_by_unit_price(price)
    all.select { |item| item.unit_price == price}
  end
  
  def find_all_by_merchant_id(merchant)
    all.select { |merchid| merchid.merchant_id.to_i == merchant}
  end

  private

  def build_items
    data.map do |row|
      Item.new(row, engine)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end
end
