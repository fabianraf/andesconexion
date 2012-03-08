class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.integer :name
      
      t.timestamps
    end
  end
end
