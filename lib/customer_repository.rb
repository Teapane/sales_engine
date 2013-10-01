 
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

    def find_all_by_first_name(first_name)
      all.select { |first| first.first_name.downcase == first_name.downcase }
    end

    def find_by_first_name(first_name)
      all.find { |first| first.first_name.downcase == first_name.downcase }
    end

    def find_all_by_last_name(last_name)
      all.select { |last| last.last_name.downcase == last_name.downcase }   
    end

    def find_by_last_name(last_name)
      all.find { |last| last.last_name.downcase == last_name.downcase }   
    end

    def find_all_by_id(customer_id)
      all.select { |customer| customer.id.to_int == customer_id.to_int }
    end

    def find_by_id(customer_id)
      all.find { |customer| customer.id == customer_id }
    end


    private

    def build_customer
      data.map do |row|
        Customer.new(row)
      end
    end

    def data  
      @data ||=CSV.open(filename, headers: true, header_converters: :symbol)
    end



  end
