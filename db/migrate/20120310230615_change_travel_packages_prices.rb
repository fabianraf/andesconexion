class ChangeTravelPackagesPrices < ActiveRecord::Migration
  def change
    change_table :travel_packages do |t|
      t.change :price, :decimal, {:precision => 12, :scale => 2}
      t.change :sale_price, :decimal, {:precision => 12, :scale => 2}
    end
    change_table :travel_packages do |t|
      t.change :description, :text
    end
  end
  

  end
