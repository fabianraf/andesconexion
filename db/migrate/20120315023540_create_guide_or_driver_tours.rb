class CreateGuideOrDriverTours < ActiveRecord::Migration
  def change
    create_table :guide_or_driver_tours do |t|
      t.integer "travel_package_id"
      t.decimal "one_pax", :precision => 12, :scale => 2
      t.decimal "two_pax", :precision => 12, :scale => 2
      t.decimal "three_pax", :precision => 12, :scale => 2
      t.decimal "four_nine_pax", :precision => 12, :scale => 2
      t.decimal "ten_fifteen_pax", :precision => 12, :scale => 2
      t.decimal "sixteen_twentyfive_pax", :precision => 12, :scale => 2
      t.decimal "four_pax", :precision => 12, :scale => 2
      t.decimal "five_nine_pax", :precision => 12, :scale => 2
      t.decimal "twenty_more_pax", :precision => 12, :scale => 2
      t.timestamps
    end
  end
end
