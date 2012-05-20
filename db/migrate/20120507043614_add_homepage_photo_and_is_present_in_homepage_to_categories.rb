class AddHomepagePhotoAndIsPresentInHomepageToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :homepage_photo_file_name, :string
    add_column :categories, :homepage_photo_content_type, :string
    add_column :categories, :homepage_photo_file_size, :integer      
    add_column :categories, :homepage_photo_updated_at, :datetime
    add_column :categories, :is_present_in_homepage, :boolean
  end
end
