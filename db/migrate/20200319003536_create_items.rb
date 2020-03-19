class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string id: false
      t.string :name
      t.text :description
      t.float :unit_price
      t.references :merchant, foreign_key: true
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
