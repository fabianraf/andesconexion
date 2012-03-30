class RemoveTableGuideOrDriverTours < ActiveRecord::Migration
  def up
    drop_table :guide_or_driver_tours
  end

  def down
  end
end
