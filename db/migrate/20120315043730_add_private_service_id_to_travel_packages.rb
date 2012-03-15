class AddPrivateServiceIdToTravelPackages < ActiveRecord::Migration
  def change
    add_column :travel_packages, :private_service_id, :integer
  end
end
