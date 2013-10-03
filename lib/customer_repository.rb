 
  class CustomerRepository

    attr_reader :filename,
    :engine

    def all
      @all ||= build_customer
    end

    def random
      all.sample
    end

    def initialize(filename, engine)
      @filename = filename
      @engine = engine
    end

    %w(id first_name last_name created_at updated_at).each do |var|
    define_method "find_by_#{var}" do |value|
      all.find {|customer| customer.send(var).downcase == value.downcase }
    end
  end

  %w(id first_name last_name created_at updated_at).each do |var|
    define_method "find_all_by_#{var}" do |value|
      all.select { |customer| customer.send(var).downcase == value.downcase }
    end
  end


  #   def find_all_by_first_name(first_name)
  #     all.select { |first| first.first_name.downcase == first_name.downcase }
  #   end

  #   def find_by_first_name(first_name)
  #     all.find { |first| first.first_name.downcase == first_name.downcase }
  #   end

  #   def find_all_by_last_name(last_name)
  #     all.select { |last| last.last_name.downcase == last_name.downcase }   
  #   end

  #   def find_by_last_name(last_name)
  #     all.find { |last| last.last_name.downcase == last_name.downcase }   
  #   end

  #   def find_all_by_id(customer_id)
  #     all.select { |customer| customer.id.to_i == customer_id.to_i }
  #   end

  #   def find_by_id(customer_id)
  #     all.find { |customer| customer.id.to_i == customer_id.to_i }
  #   end


    private

    def build_customer
      data.map do |row|
        Customer.new(row, engine)
      end
    end

    def data  
      @data ||=CSV.open(filename, headers: true, header_converters: :symbol)
    end

end

  # end
