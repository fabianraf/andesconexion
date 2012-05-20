class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.integer :category_id
      t.string :name
      t.string :overview
      t.text :itinerary
      t.text :included
      t.text :not_included
      t.text :prices
      t.timestamps
    end
  end
end
