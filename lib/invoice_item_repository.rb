require 'csv'

class InvoiceItemRepository
  attr_reader :filename,
  :engine

   def initialize(filename, engine = SalesEngine.new)
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
    all.select { |invoiceitem| invoiceitem == id }
  end 

  def find_by_id(id)
    all.find { |invoiceitem| invoiceitem == id }
  end

  def find_all_by_item_id(item_id)
        all.select { |item| item.item_id == item_id }
  end

  def find_all_by_invoice_id(invoice_id)
      all.select { |invoice_item| invoice_item.invoice_id == invoice_id}
  end

  def find_by_invoice_id(invoice_id)
      all.find { |invoice_item| invoice_item.invoice_id == invoice_id}
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
      InvoiceItem.new(row, engine)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end
end
