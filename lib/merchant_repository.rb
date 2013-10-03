class MerchantRepository

  attr_reader :filename,
  :engine

 

  def initialize(filename, engine)
    @filename = filename
    @engine = engine
  end

  def all
    @all ||=build_merchant
  end

  def random
    all.sample
  end

  def find_all_by_name(merchant_name)
    all.select { |merchant| merchant.name.downcase == merchant_name.downcase }
  end 

  def find_by_name(merchant_name)
    all.find { |merchant| merchant.name.downcase == merchant_name.downcase }
  end 

  def find_all_by_id(merchant_id)
    all.select { |merchant| merchant.id.to_i == merchant_id.to_i }
  end

  def find_by_id(merchant_id)
    all.find { |merchant| merchant.id.to_i == merchant_id.to_i }
  end

   def find_by_id(customer_id)
      all.find { |customer| customer.id.to_i == customer_id.to_i }
    end

    def find_all_by_id(customer_id)
      all.find { |customer| customer.id.to_i == customer_id.to_i }
    end

  #def find_items_by_merchant_id(id)
   # sales_engine.item_repository.find_all_by_merchant_id
  #end

  #def add(merchant)
    #merchant.merchant_repository = self
    #@merchants << merchant
  #end

  

  private

  def build_merchant
    data.map do |row|
      Merchant.new(row, engine)
    end
  end

  def data  
    @data ||=CSV.open(filename, headers: true, header_converters: :symbol)
  end
end



