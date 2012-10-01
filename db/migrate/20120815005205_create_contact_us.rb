class CreateContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|
      t.string "name"
      t.string "surname"
      t.string "nationality"
      t.string "nationality"
      t.string "email"
      t.integer "number_of_passengers"
      t.string "destination_or_package_of_interest"
      t.string "aprox_date_of_travel"
      t.timestamps
    end
  end
end
