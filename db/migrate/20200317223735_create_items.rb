class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string id: false
      t.string :name
      t.text :description
      t.integer :unit_price
      t.string :merchant_id
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
