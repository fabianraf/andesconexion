class ChangeCountryDataTypeInTravelPackages < ActiveRecord::Migration
  def up
    change_column :travel_packages, :country_id, :string
    rename_column :travel_packages, :country_id, :country
  end

  def down
    rename_column :travel_packages, :country, :country_id
    change_column :travel_packages, :country_id, :integer
  end
end
