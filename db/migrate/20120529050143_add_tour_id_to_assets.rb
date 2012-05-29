class AddTourIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :tour_id, :integer
  end
end
