class AddCountryToPrivateServices < ActiveRecord::Migration
  def change
    add_column :private_services, :country, :string
  end
end
