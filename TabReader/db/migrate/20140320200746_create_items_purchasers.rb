class CreateItemsPurchasers < ActiveRecord::Migration
  def change
    create_table :items_purchasers do |t|
      t.integer :item_id
      t.integer :purchaser_id
      t.integer :count
    end

    add_index :items_purchasers, [:purchaser_id, :item_id]
  end
end
