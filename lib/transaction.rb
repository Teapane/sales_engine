require './lib/transaction_repository'
class Transaction

  attr_reader :engine


 def initialize(attributes, engine = SalesEngine.new)
  @id = attributes[:id]
  @invoice_id = attributes[:invoice_id]
  @credit_card_number = attributes [:credit_card_number]
  @expiration = attributes[:credit_card_expiration]
  @result = attributes[:result]
  @created_time = attributes[:created_at]
  @updated_time = attributes[:updated_at]
  @engine = engine
 end

 def id
  @id
 end

 def invoice_id
  @invoice_id
 end

 def credit_card_number
  @credit_card_number
 end

 def credit_card_expiration
  @expiration
  end

  def result
    if @result == "success"
      "success"
    else 
      "failed"
    end
  end

  def created_at
    @created_at ||= Time.strptime(@created_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def updated_at
    @updated_at ||= Time.strptime(@updated_time, "%Y-%m-%d %H:%M:%S %z")
  end

  def invoice
    engine.invoice_repository.find_all_by_id(self.invoice_id)
  end
  


end
