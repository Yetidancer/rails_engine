class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.string id: false
      t.string :item_id
      t.string :invoice_id
      t.integer :quantity
      t.integer :unit_price
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
