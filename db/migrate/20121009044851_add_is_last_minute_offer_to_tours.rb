class AddIsLastMinuteOfferToTours < ActiveRecord::Migration
  def change
    add_column :tours, :is_last_minute_offer, :boolean
  end
end
