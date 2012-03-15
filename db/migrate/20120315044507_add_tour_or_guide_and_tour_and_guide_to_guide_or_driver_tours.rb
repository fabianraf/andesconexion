class AddTourOrGuideAndTourAndGuideToGuideOrDriverTours < ActiveRecord::Migration
  def change
    add_column :guide_or_driver_tours, :tour_or_guide, :boolean
    add_column :guide_or_driver_tours, :tour_and_guide, :boolean
  end
end
