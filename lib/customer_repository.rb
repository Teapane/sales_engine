  class CustomerRepository

    attr_reader :filename

    def all
      @all ||= build_customer
    end

    def random
    all.sample
    end

    def initialize(filename)
      @filename = filename
    end

    def first_name(first_name)
      all.select { |first| first.first_name.downcase == first_name.downcase }
    end

    def last_name(last_name)
      all.select { |last| last.last_name.downcase == last_name.downcase }   
    end

    def find_id(customer_id)
    all.detect { |customer| customer.id == customer_id }
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
