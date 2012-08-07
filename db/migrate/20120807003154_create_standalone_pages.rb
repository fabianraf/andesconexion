class CreateStandalonePages < ActiveRecord::Migration
  def change
    create_table :standalone_pages do |t|
      t.string "name"
      t.text "description"
      t.timestamps
    end
  end
end
