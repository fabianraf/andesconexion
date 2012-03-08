class CreateTravelPackages < ActiveRecord::Migration
  def change
    create_table :travel_packages do |t|
      t.string :name
      t.string :description
      t.integer :country_id
      t.string :city
      t.decimal :price, :precision => 2, :decimals => 2
      t.decimal :sale_price, :precision => 2, :decimals => 2
      t.timestamps
    end
  end
end
