class Merchant

  def initialize(attributes)
    @id = attributes[:id].to_i
    @name = attributes[:name]
    @created_time = attributes[:created_at]
    @updated_time = attributes[:updated_at]
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

end
