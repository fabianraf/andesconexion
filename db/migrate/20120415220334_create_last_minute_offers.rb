class CreateLastMinuteOffers < ActiveRecord::Migration
  def change
    create_table :last_minute_offers do |t|
      t.string :title
      t.text :description
      t.decimal :start_from_price, :precision => 12, :scale => 2
      t.timestamps
    end
  end
end
