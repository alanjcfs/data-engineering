class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :price
      t.text :description
      t.integer :merchant_id

      t.timestamps
    end

    add_index :items, :merchant_id
  end
end
