class AddSortOrderToStandalonePages < ActiveRecord::Migration
  def change
    add_column :standalone_pages, :sort_order, :integer
  end
end
