class CreateTourDays < ActiveRecord::Migration
  def change
    create_table :tour_days do |t|
      t.string "day_name"
      t.text "description"
      t.integer "tour_id"
      t.timestamps
    end
  end
end
