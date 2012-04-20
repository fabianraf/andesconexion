class CreateLastMinuteDates < ActiveRecord::Migration
  def change
    create_table :last_minute_dates do |t|
      t.integer :last_minute_offer_id
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
