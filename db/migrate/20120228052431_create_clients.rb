class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :lastname
      t.string :preferred_name
      t.integer :country_id
      t.string :city
      t.timestamps
    end
  end
end
