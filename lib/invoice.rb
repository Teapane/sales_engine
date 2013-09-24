class Invoice

  attr_reader :id,
  :customer_id,
  :merchant_id,
  :status

  def initialize(attributes)
    @id = attributes[:id].to_i
    @customer_id = attributes[:customer_id].to_i
    @merchant_id = attributes[:merchant_id].to_i
    @status = attributes[:status]
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
