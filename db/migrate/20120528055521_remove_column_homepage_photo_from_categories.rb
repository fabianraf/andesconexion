class RemoveColumnHomepagePhotoFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :homepage_photo_file_name
    remove_column :categories, :homepage_photo_content_type
    remove_column :categories, :homepage_photo_file_size
    remove_column :categories, :homepage_photo_updated_at
  end

  def down
    add_column :categories, :homepage_photo_file_name, :string
    add_column :categories, :homepage_photo_content_type, :string
    add_column :categories, :homepage_photo_file_size, :integer      
    add_column :categories, :homepage_photo_updated_at, :datetime
  end
end
