class AddPageTitleAndMetaTagsToTours < ActiveRecord::Migration
  def change
    add_column :tours, :page_title, :text
    add_column :tours, :meta_tag, :text
  end
end
