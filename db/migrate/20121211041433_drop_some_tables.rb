class DropSomeTables < ActiveRecord::Migration
  def up
    drop_table :travel_packages
    drop_table :travel_package_images
    drop_table :private_services
    drop_table :last_minute_dates
    drop_table :last_minute_offers
  end

  def down
  end
end
