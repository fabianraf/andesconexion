class AddDurationToTravelPackages < ActiveRecord::Migration
  def change
    add_column :travel_packages, :duration, :string
  end
end
