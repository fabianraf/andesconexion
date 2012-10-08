class AddTourImageIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :tour_image_id, :integer
  end
end
