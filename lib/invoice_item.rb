class InvoiceItem
attr_reader :id,
  :item_id,
  :invoice_id,
  :quantity,
  :unit_price,
  :engine

  def initialize(attributes, engine = SalesEngine.new)
    @id = attributes[:id]
    @item_id = attributes[:item_id]
    @invoice_id = attributes[:invoice_id]
    @quantity = attributes[:quantity]
    @created_time = attributes[:created_at]
    @updated_time = attributes[:updated_at]
    @engine = engine
  end

  def created_at
    @created_at ||= Time.strptime(@created_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def updated_at
    @updated_at ||= Time.strptime(@updated_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def item
    engine.item_repository.find_by_id(self.item_id)
  end 
  
end

