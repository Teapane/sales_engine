require 'csv'

class InvoiceItemRepository
  attr_reader :filename,
  :engine

   def initialize(filename, engine)
    @filename = filename
    @engine = engine
  end

  def all
    @all ||= invoice_items
  end

  def random
    all.sample
  end

  def find_all_by_id(id)
    all.select { |invoiceitem| invoiceitem.id.to_i == id.to_i }
  end 

  def find_by_id(id)
    all.find { |invoiceitem| invoiceitem.id.to_i == id.to_i }
  end

  def find_all_by_item_id(item_id)
        all.select { |item| item.item_id.to_i == item_id.to_i }
  end

  def find_all_by_invoice_id(invoice_id)
      all.select { |invoice| invoice.invoice_id.to_i == invoice_id.to_i}
  end

  def find_by_invoice_id(invoice_id)
      all.find { |invoice| invoice.invoice_id.to_i == invoice_id.to_i}
  end

  def find_all_by_item_quantity(quantity)
      all.select { |invoice| invoice.quantity == quantity}
  end

   def find_by_item_quantity(quantity)
      all.find { |invoice| invoice.quantity == quantity}
  end

  def find_all_by_unit_price(unit_price)
    all.select { |invoice| invoice.unit_price == price}
  end

  def find_by_unit_price(unit_price)
    all.find { |invoice| invoice.unit_price == price}
  end
  
  private

  def invoice_items
    data.map do |row|
      InvoiceItem.new(row)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end
end
