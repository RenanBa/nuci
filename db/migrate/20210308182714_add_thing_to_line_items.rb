class AddThingToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :customer_key, :string
  end
end
