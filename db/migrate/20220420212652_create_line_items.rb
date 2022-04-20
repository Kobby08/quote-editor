class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :unit_price, precision: 10, scale: 2, default: 0.00
      t.integer :quantity, default: 0
      t.references :line_item_date, null: false, foreign_key: true

      t.timestamps
    end
  end
end
