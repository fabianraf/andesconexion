class ChangeTypeOfOverviewInTours < ActiveRecord::Migration
  def up
    change_column :tours, :overview, :text
  end

  def down
    change_column :tours, :overview, :string
  end
end
