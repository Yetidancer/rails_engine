class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.string id: false
      t.references :item, foreign_key: true
      t.references :invoice, foreign_key: true
      t.integer :quantity
      t.float :unit_price
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
