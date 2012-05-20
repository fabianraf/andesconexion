class AddLongDescriptionToLastMinuteOffers < ActiveRecord::Migration
  def change
    add_column :last_minute_offers, :long_description, :text
  end
end
