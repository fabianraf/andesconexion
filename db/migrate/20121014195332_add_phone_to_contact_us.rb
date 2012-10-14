class AddPhoneToContactUs < ActiveRecord::Migration
  def change
    add_column :contact_us, :phone, :string
  end
end
