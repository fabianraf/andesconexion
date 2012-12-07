class AddPageTitleAndMetaTagsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :page_title, :text
    add_column :categories, :meta_tag, :text
  end
end
