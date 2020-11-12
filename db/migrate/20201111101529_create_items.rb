class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :postage_payer_id, null: false
      t.integer :prefecture_code_id, null: false
      t.integer :days_to_ship_id, null: false
      t.string :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
