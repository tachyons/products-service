class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :sold_out, default: false
      t.string :category
      t.boolean :under_sale, null: false
      t.integer :price
      t.integer :sale_price
      t.string :sale_text

      t.timestamps
    end
  end
end
