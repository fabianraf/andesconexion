class AddImageToTravelPackage < ActiveRecord::Migration
  def change
    add_column :travel_packages, :image_file_name, :string
    add_column :travel_packages, :image_content_type, :string
    add_column :travel_packages, :image_file_size, :integer      
    add_column :travel_packages, :image_updated_at, :datetime
  end
end
