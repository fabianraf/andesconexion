class AddIsPresentInLowerHomepageToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :is_present_in_lowerpage, :boolean
  end
end
