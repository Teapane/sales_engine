require 'csv'
require_relative 'customer'
require_relative 'customer_repository'
require_relative 'invoice_item'
require_relative 'invoice_item_repository'
require_relative 'invoice'
require_relative 'invoice_repository'
require_relative 'item'
require_relative 'item_repository'
require_relative 'merchant'
require_relative 'merchant_repository'
require_relative 'transaction'
require_relative 'transaction_repository'

class SalesEngine

  attr_reader :customer_repository, 
              :invoice_item_repository, 
              :invoice_repository,
              :item_repository,
              :merchant_repository,
              :transaction_repository

  def initialize(dir = "./data")
    @customer_repository = CustomerRepository.new("#{dir}/customers.csv", self)
    @invoice_item_repository = InvoiceItemRepository.new("#{dir}/invoice_items.csv", self)
    @invoice_repository = InvoiceRepository.new("#{dir}/invoices.csv", self)
    @item_repository = ItemRepository.new("#{dir}/items.csv", self)
    @merchant_repository = MerchantRepository.new("#{dir}/merchants.csv", self)
    @transaction_repository = TransactionRepository.new("#{dir}/transactions.csv", self)
  end

  def startup
  end

end
