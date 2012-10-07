class AddBannerIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :banner_id, :integer
  end
end
