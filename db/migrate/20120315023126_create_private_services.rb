class CreatePrivateServices < ActiveRecord::Migration
  def change
    create_table :private_services do |t|
      t.string "name"
      t.string "city"
      t.timestamps
    end
  end
end
