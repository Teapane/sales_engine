class Customer

  attr_reader :id,
  :first_name,
  :last_name
  

  def initialize(attributes)
    @id = attributes[:id].to_i
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @created_time = attributes[:created_at]
  end
  
  def created_at
    @created_at ||= Time.strptime(@created_time, "%Y-%m-%d %H:%M:%S %z")
  end


end

