class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "nationality"
      t.string "email"
      t.integer "number_of_passengers"
      t.integer "tour_id"
      t.string "aprox_date_of_travel"
      t.text "comments"
      t.timestamps
    end
  end
end
