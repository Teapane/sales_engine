
require 'csv'

class TransactionRepository
  attr_reader :filename, 
  :engine

  def initialize(filename, engine)
    @filename = filename
    @engine = engine
  end

  def all
    @all ||= build_transactions
  end

  def random
    all.sample
  end

  def find_by_id(id)
    all.find {|transaction| transaction.id == id }
  end

  def find_by_invoice_id(invoice_id)
    all.find {|transaction| transaction.invoice_id == invoice_id }
  end

  def find_by_card_number(cardnumber)
    all.find {|transaction| transaction.credit_card_number == cardnumber }
  end

  def find_by_result(result)
    all.find {|transaction| transaction.result == result}
  end

  def find_all_by_id(id)
    all.select { |transaction| transaction.id == id }
  end 

  def find_all_by_invoice_id(invoice_id)
        all.select { |transaction| transaction.invoice_id == invoice_id }
  end

  def find_all_by_card_number(cardnumber)
      all.select { |transaction| transaction.credit_card_number == cardnumber}
  end

  def find_all_by_result(result)
    all.select { |transaction| transaction.result == result}
  end

  
 
  private

  def build_transactions
    data.map do |row|
      Transaction.new(row, engine)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end
end
