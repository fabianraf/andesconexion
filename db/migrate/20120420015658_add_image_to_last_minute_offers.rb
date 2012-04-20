class AddImageToLastMinuteOffers < ActiveRecord::Migration
  def change
    add_column :last_minute_offers, :image_file_name, :string
    add_column :last_minute_offers, :image_content_type, :string
    add_column :last_minute_offers, :image_file_size, :integer      
    add_column :last_minute_offers, :image_updated_at, :datetime
  end
end
