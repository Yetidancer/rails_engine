require 'csv'

namespace :csv_load do
  desc "Load CSV"
  task :load => :environment do
    puts "Clearing database tables"
    Transaction.delete_all
    InvoiceItem.delete_all
    Invoice.delete_all
    Customer.delete_all
    Item.delete_all
    Merchant.delete_all
    puts "Importing Merchants"
    CSV.foreach('./db/data/merchants.csv', :headers => true) do |row|
      Merchant.create!(row.to_hash)
    end
    puts "Importing Items"
    CSV.foreach('./db/data/items.csv', :headers => true) do |row|
      Item.create!(row.to_hash)
      Item.last.update_attribute(:unit_price, Item.last.convert_price)
    end
    puts "Importing Customers"
    CSV.foreach('./db/data/customers.csv', :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
    puts "Importing Invoices"
    CSV.foreach('./db/data/invoices.csv', :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
    puts "Importing Invoice Items"
    CSV.foreach('./db/data/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
      InvoiceItem.last.update_attribute(:unit_price, InvoiceItem.last.convert_price)
    end
    puts "Importing Transactions"
    CSV.foreach('./db/data/transactions.csv', :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
    puts "All CSV Files Imported"
  end

  desc "Unload CSV"
  task unload: :environment do
  end

end
