require_relative 'customer_repository'
require_relative 'sales_engine'




class Customer

  attr_reader :id,
  :first_name,
  :last_name,
  :engine
  

  def initialize(attributes, engine = SalesEngine.new)
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
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

  def invoices
    engine.invoice_repository.find_all_by_customer_id(self.id)
  end

end

