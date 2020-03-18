require 'csv'

namespace :csv_load do
  desc "Load CSV"
  task :load => :environment do
    Customer.delete_all
    InvoiceItem.delete_all
    Invoice.delete_all
    Item.delete_all
    Merchant.delete_all
    Transaction.delete_all
    CSV.foreach('./db/data/customers.csv', :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
    CSV.foreach('./db/data/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
      InvoiceItem.last.write_attribute(:unit_price, ((self.unit_price) / 100))
    end
    CSV.foreach('./db/data/invoices.csv', :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
    CSV.foreach('./db/data/items.csv', :headers => true) do |row|
      Item.create!(row.to_hash)
      Item.last.write_attribute(:unit_price, ((self.unit_price) / 100))
    end
    CSV.foreach('./db/data/merchants.csv', :headers => true) do |row|
      Merchant.create!(row.to_hash)
    end
    CSV.foreach('./db/data/transactions.csv', :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
  end

  desc "Unload CSV"
  task unload: :environment do
  end

end
