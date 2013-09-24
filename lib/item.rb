class Item

  def initialize(attributes)
    @id = attributes[:id].to_i
    @name = attributes[:name]
    @description = attributes[:description]
    @unit_price = attributes[:unit_price]
    @merchant_id = attributes[:merchant_id].to_i
    @created_time = attributes[:created_at]
    @updated_time = attributes[:updated_at]
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

end
