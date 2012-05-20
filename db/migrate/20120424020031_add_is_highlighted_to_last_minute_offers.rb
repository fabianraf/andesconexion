class AddIsHighlightedToLastMinuteOffers < ActiveRecord::Migration
  def change
    add_column :last_minute_offers, :is_highlighted, :boolean
  end
end
