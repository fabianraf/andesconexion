class AddUserIdToCategoriesAndTours < ActiveRecord::Migration
  def change
    add_column :categories, :created_by_id, :integer
    add_column :categories, :last_updated_by_id, :integer
    add_column :tours, :created_by_id, :integer
    add_column :tours, :last_updated_by_id, :integer
    add_column :standalone_pages, :created_by_id, :integer
    add_column :standalone_pages, :last_updated_by_id, :integer
    add_column :hotels, :created_by_id, :integer
    add_column :hotels, :last_updated_by_id, :integer
  end
end
