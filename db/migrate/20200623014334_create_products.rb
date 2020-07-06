class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title,                   null: false
      t.text :introduction,              null: false
      t.integer :price,                  null: false
      t.integer :prefecture_id,          null: false
      t.integer :deliveryperson_id,      null: false
      t.integer :deliveryleadtime_id,    null: false
      t.integer :deliveryway_id,         null: false
      t.integer :productstatus_id,       null: false
      t.references :category,            null: false, foreign_key: true
      t.references :buyer,               foreign_key: {to_table: :users}
      t.references :seller,              foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
