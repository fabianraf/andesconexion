class AddImageToTravelPackageImages < ActiveRecord::Migration
  def change
      add_column :travel_package_images, :travel_package_id, :integer
      add_column :travel_package_images, :image_file_name, :string
      add_column :travel_package_images, :image_content_type, :string
      add_column :travel_package_images, :image_file_size, :integer      
      add_column :travel_package_images, :image_updated_at, :datetime
  end
end
