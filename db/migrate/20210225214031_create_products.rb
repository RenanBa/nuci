class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :size
      t.decimal :price
      t.integer :quantity
      t.string :color
      t.text :description
      t.integer :rating
      t.string :image_url
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
