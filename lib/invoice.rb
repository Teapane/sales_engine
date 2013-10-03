require_relative 'invoice_repository'
require_relative 'sales_engine'
require_relative 'transaction'
require_relative 'invoice_item'


class Invoice

  attr_reader :id,
  :customer_id,
  :merchant_id,
  :status,
  :repository,
  :engine

  def initialize(attributes, engine = SalesEngine.new)
    @id = attributes[:id]
    @customer_id = attributes[:customer_id]
    @merchant_id = attributes[:merchant_id]
    @status = attributes[:status]
    @created_time = attributes[:created_at]
    @updated_time = attributes[:updated_at]
    @engine = engine 
  end

  def items
    repository.items_for(self?)
  end

  def created_at
    @created_at ||= Time.strptime(@created_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def updated_at
    @updated_at ||= Time.strptime(@updated_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def transactions
    engine.transaction_repository.find_all_by_invoice_id(self.id)
  end

  def invoice_items
    engine.invoice_item_repository.find_all_by_invoice_id(self.id)
  end

   def items
    invoice_items.map do |invoice_item|
      invoice_item.item
    end
  end

  def customer
    engine.customer_repository.find_by_id(self.id)
  end

  def merchant
    engine.merchant_repository.find_by_id(self.id)
  end

end

  
  

