class AddIsActiveToStandalonePages < ActiveRecord::Migration
  def change
    add_column :standalone_pages, :is_active, :boolean
  end
end
