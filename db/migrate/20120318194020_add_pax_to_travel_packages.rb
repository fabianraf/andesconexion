class AddPaxToTravelPackages < ActiveRecord::Migration
  def change
    add_column :travel_packages, :one_pax_g_or_d, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :two_pax_g_or_d, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :three_pax_g_or_d, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :one_pax_g_and_d, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :two_pax_g_and_d, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :three_pax_g_and_d, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :four_pax_g_and_d, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :four_to_nine_pax, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :ten_to_fifteen_pax, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :sixteen_to_twentyfive_pax, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :five_to_nine_pax, :decimal, :precision => 12, :scale => 2
    add_column :travel_packages, :twenty_more_pax, :decimal, :precision => 12, :scale => 2
  end
end
