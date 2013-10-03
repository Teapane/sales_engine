

class InvoiceRepository
  attr_reader :filename,
  :engine

  def initialize(filename = "./data/invoices.csv", engine)
    @filename = filename
    @engine = engine
  end

  def all
    @all ||= build_invoice
  end

  def random
    all.sample
  end

  def find_all_by_customer_id(customer_id)
    all.select { |invoice| invoice.customer_id.to_i == customer_id.to_i }
  end 

  def find_by_customer_id(customer_id)
    all.find { |invoice| invoice.customer_id.to_i == customer_id.to_i }
  end 

  def find_all_by_merchant_id(merchant_id)
    all.select { |invoice| invoice.merchant_id.to_i == merchant_id.to_i }
  end

  def find_by_merchant_id(merchant_id)
    all.find { |invoice| invoice.merchant_id.to_i == merchant_id.to_i }
  end

  def find_all_by_transaction_id(transaction_id)
    all.select { |invoice| invoice.id.to_i == transaction_id.to_i }
  end

   def find_by_transaction_id(transaction_id)
    all.find { |invoice| invoice.id.to_i == transaction_id.to_i }
   end

   def find_by_status(shipping_status)
    all.find { |invoice| invoice.status == shipping_status }
   end

 
    


    private

    def build_invoice
      data.map do |row|
        Invoice.new(row, engine)
      end
    end

    def data
      @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
    end
  end
