class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string id: false
      t.references :customer, foreign_key: true
      t.references :merchant, foreign_key: true
      t.string :status
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
