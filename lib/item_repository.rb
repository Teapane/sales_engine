require 'csv'

class ItemRepository
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def all
    @all ||= build_items
  end

  def random
    all.sample
  end

  def find_id(id)
    all.select { |item| item.id.to_int == id.to_int }
  end 

  def find_name(name)
        all.select { |item| item.name == name }
  end

  def find_description(description)
      all.select { |item| item.description == description}
  end

  def find_unit_price(price)
    all.select { |item| item.unit_price == price}
  end
  
  def find_merchant_id(merch)
      all.select { |merchid| merchid.merchant_id == merch}
  end

  private

  def build_items
    data.map do |row|
      Item.new(row)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end
end
