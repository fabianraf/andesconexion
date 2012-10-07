class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.text :description
      t.boolean "is_active"
      t.timestamps
    end
  end
end
