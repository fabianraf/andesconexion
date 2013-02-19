class AddCachedSlugToTours < ActiveRecord::Migration
  
  def self.up
    add_column :tours, :cached_slug, :string
    add_index  :tours, :cached_slug
  end

  def self.down
    remove_column :tours, :cached_slug
  end
  
end
