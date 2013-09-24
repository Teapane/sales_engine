class Transaction

 def initialize(attributes)
  @id = attributes[:id].to_i
  @invoice_id = attributes[:invoice_id].to_i
  @CCN = attributes [:credit_card_number].to_i
  @expiration = attributes[:credit_card_expiration]
  @result = attributes[:result]
  @created_time = attributes[:created_at]
  @updated_time = attributes[:updated_at]
 end

 def id
  @id
 end

 def invoice_id
  @invoice_id
 end

 def credit_card_number
  @CCN
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

end
