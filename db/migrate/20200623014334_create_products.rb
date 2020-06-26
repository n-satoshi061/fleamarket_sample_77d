class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title,             null: false
      t.text :introduction,        null: false
      t.integer :price,            null: false
      t.string :from_area,         null: false
      t.boolean :delivery_person,  null: false
      t.string :delivery_leadtime, null: false
      t.string :delivery_way,      null: false
      t.integer :status,           null: false
      t.references :category,      null: false, foreign_key: true
      t.references :buyer,         foreign_key: {to_table: :users}
      t.references :seller,        foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
