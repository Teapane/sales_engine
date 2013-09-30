class MerchantRepository

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def all
    @all ||=build_merchant
  end

  def random
    all.sample
  end

  def find_name(merchant_name)
    all.select { |merchant| merchant.name.downcase == merchant_name.downcase }
  end 

  def find_id(merchant_id)
    all.detect { |merchant| merchant.id == merchant_id }
  end

  def id
    @id = attributes[:id].to_i
  end

  

  

  private

  def build_merchant
    data.map do |row|
      Merchant.new(row)
    end
  end

  def data  
    @data ||=CSV.open(filename, headers: true, header_converters: :symbol)
  end
end



