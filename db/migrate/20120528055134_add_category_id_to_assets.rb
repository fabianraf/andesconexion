class AddCategoryIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :category_id, :integer
  end
end
