
class TransactionRepository

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end


  def all
    @all ||=build_transaction
  end

  def find_id(id)
    all.detect { |number| number.id == id }
    end

  def find_invoice_id(invoice_id)
    all.detect { |number| number.id == invoice_id}
  end

  #def find_credit_card_number(ccn)
    #all.detect { |credit_number| credit_number.credit_card_number == ccn.to_i}
  #end

  def find_results(results)
    all.detect { |result| result.results == results }
 
end



private

    def build_transaction
      data.map do |row|
        Transaction.new(row)
      end
    end

    def data  
      @data ||=CSV.open(filename, headers: true, header_converters: :symbol)
    end

  end




