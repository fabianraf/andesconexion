class AddImageToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :image_file_name, :string
    add_column :hotels, :image_content_type, :string
    add_column :hotels, :image_file_size, :integer      
    add_column :hotels, :image_updated_at, :datetime
    change_column :hotels, :country_id, :string
    rename_column :hotels, :country_id, :country
  end
end
