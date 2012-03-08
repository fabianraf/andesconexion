class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :description
      t.integer :country_id
      t.string :city
      t.timestamps
    end
  end
end
