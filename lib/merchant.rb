class Merchant 
  def initialize(attributes, engine = SalesEngine.new)
    @id = attributes[:id]
    @name = attributes[:name]
    @created_time = attributes[:created_at]
    @updated_time = attributes[:updated_at]
    @engine = engine
  end

  def engine
    @engine
  end
  
  def id
    @id
  end

  def name
    @name
  end

  def created_at
    @created_at ||= Time.strptime(@created_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def updated_at
    @updated_at ||= Time.strptime(@updated_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def items
    engine.item_repository.find_all_by_merchant_id(self.id)
  end

  def invoices
    engine.invoice_repository.find_all_by_merchant_id(self.id)
  end

  def revenue
    invoices.collect do |invoice|
      invoice.transactions
    end
  end


end
