class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :post_code, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :building_name
      t.integer :area_id, null: false
      t.references :buy, null: false, foreign_key: true
      t.timestamps
    end
  end
end
