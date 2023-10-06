class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string :post, null: false
      t.string :village, null: false
      t.string :explanation, null: false
      t.string :telephone, null: false
      t.string :building
      t.integer :prefecture_id, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
