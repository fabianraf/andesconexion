class ChangeDestinationOrPackageOfInterestOnContactUs < ActiveRecord::Migration
  def up
    change_table :contact_us do |t|
      t.change :destination_or_package_of_interest, :text
    end
    remove_column :contact_us, :aprox_date_of_travel
    add_column :contact_us, :aprox_date_of_travel, :datetime
  end

  def down
  end
end
