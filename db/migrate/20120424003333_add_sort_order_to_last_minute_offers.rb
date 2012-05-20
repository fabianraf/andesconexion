class AddSortOrderToLastMinuteOffers < ActiveRecord::Migration
  def change
    add_column :last_minute_offers, :sort_order, :integer
  end
end
