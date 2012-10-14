class DropTableBanners < ActiveRecord::Migration
  def up        
    drop_table :banners
  end

  def down
  end
end
