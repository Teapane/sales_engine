=begin
class InvoiceRepository

attr_reader :filename

  def all
      @all ||= build_invoice
  end

  def invoice_id(id)
    all.detect { |invoice_id| invoice_id.id == invoice_id }
  end


private

  def build_invoice
    data.map do |row|
      Invoice.new(row)
    end
  end

  def data  
    @data ||=CSV.open(filename, headers: true, header_converters: :symbol)
  end
end
=end
