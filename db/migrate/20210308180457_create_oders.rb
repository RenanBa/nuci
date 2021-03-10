class CreateOders < ActiveRecord::Migration[6.1]
  def change
    create_table :oders do |t|
      t.decimal :subtotal
      t.decimal :sales_tax
      t.decimal :grand_total
      t.integer :user_id
      t.text :order_items

      t.timestamps null: false
    end
  end
end
