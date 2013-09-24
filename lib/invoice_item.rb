class InvoiceItem
attr_reader :id,
  :item_id,
  :invoice_id,
  :quantity
  :unit_price

  def initialize(attributes)
    @id = attributes[:id].to_i
    @item_id = attributes[:item_id].to_i
    @invoice_id = attributes[:invoice_id].to_i
    @quantity = attributes[:quantity]
    @created_time = attributes[:created_at]
    @updated_time = attributes[:updated_at]
  end

  def created_at
    @created_at ||= Time.strptime(@created_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def updated_at
    @updated_at ||= Time.strptime(@updated_time, "%Y-%m-%d %H:%M:%S %z")
  end
end

