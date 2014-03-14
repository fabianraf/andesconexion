class AddBriefDescriptionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :brief_description, :string
  end
end
