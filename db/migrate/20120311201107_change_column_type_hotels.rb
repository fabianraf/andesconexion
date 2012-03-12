class ChangeColumnTypeHotels < ActiveRecord::Migration
  def up
    change_column :hotels, :description, :text
  end

  def down
  end
end
