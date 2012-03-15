class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string "name"
      t.string "departure_day"
      t.string "day_night"
      t.decimal "two_pax", :precision => 12, :scale => 2
      t.decimal "sgl_suppl", :precision => 12, :scale => 2
      t.timestamps
    end
  end
end
