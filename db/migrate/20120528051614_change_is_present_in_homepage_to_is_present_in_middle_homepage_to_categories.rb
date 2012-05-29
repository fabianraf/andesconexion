class ChangeIsPresentInHomepageToIsPresentInMiddleHomepageToCategories < ActiveRecord::Migration
  def up
    rename_column :categories, :is_present_in_homepage, :is_present_in_middle_homepage
  end

  def down
    rename_column :categories, :is_present_in_middle_homepage, :is_present_in_homepage
  end
end
