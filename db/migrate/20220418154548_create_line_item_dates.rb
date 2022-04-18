class CreateLineItemDates < ActiveRecord::Migration[7.0]
  def change
    create_table :line_item_dates do |t|
      t.date :date, null: false
      t.integer :quote_id, null: false, index: true

      t.timestamps
    end
  end
end
