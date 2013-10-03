class Item

  def initialize(attributes, engine = SalesEngine.new)
    @id = attributes[:id]
    @name = attributes[:name]
    @description = attributes[:description]
    @unit_price = attributes[:unit_price]
    @merchant_id = attributes[:merchant_id]
    @created_time = attributes[:created_at]
    @updated_time = attributes[:updated_at]
    @engine = engine
  end

  def id
    @id
  end

  def name
    @name
  end

  def description
    @description
  end

  def unit_price
    @unit_price
  end

  def merchant_id
    @merchant_id
  end

  def created_at
    @created_at ||= Time.strptime(@created_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def updated_at
    @updated_at ||= Time.strptime(@updated_time, "%Y-%m-%d %H:%M:%S %z")
  end

   def invoice_items
    engine.invoice_item_repository.find_all_by_item_id(self.id)
  end

  def merchant
    engine.merchant_repository.find_by_id(self.merchant_id)
  end

end
