class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.string :name, null: false
      t.integer :company_id, null: false, index: true

      t.timestamps
    end
  end
end
