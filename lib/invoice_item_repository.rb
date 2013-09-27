require 'csv'

class InvoiceRepository
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def all
    @all ||= build_invoice
  end

  def random
    all.sample
  end

  def find_customer_id(customer_id)
    all.select { |invoice| invoice.customer_id == customer_id }
  end 

  def find_merchant_id(merchant_id)
    all.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_id(transaction_id)
    all.select { |invoice| invoice.id == transaction_id }
  end

  def find_status(shipping_status)
    all.select { |invoice| invoice.status == shipping_status }
  end

    private

    def build_invoice
      data.map do |row|
        Invoice.new(row)
      end
    end

    def data
      @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
    end
  end
