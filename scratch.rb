=begin
 attr_reader :id,
  :first_name,
  :last_name,
  :created_at,
  :updated_at,


  def initialize(data)
    @id = data.["id"].to_i
    @first_name = data.["first_name"]
    @last_name = data.["last_name"]
    @created_at = data.parse(data["created_at"])
    @updated_at = data.parse(data["updated_at"])
  end

end


def test_it_loads_invoice_item_repository
    skip
    invoice_item_repository = InvoiceItemRepository.new
    assert_kind_of invoice_item_repository.class, sales_engine.invoice_item_repository
  end 

  def test_it_loads_invoice_repository
    skip
    invoice_repository = InvoiceRepository.new
    assert_kind_of invoice_repository.class, sales_engine.invoice_repository
  end 

  def test_it_loads_item_repository
    skip
    item_repository = ItemRepository.new
    assert_kind_of item_repository.class, sales_engine.item_repository
  end 

  def test_it_loads_merchant_repository
    skip
    merchant_repository = MerchantRepository.new
    assert_kind_of merchant_repository.class, sales_engine.merchant_repository
  end 

  def test_it_loads_transaction_repository
    skip
    transaction_repository = TransactionRepository.new
    assert_kind_of transaction_repository.class, sales_engine.transaction_repository
  end 

end
