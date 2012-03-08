class CreateTravelPackageImages < ActiveRecord::Migration
  def change
    create_table :travel_package_images do |t|

      t.timestamps
    end
  end
end
