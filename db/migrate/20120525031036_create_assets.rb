class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :attachment_content_type, :attachment_file_name, :type, :title
      t.integer :attachment_size, :user_id
      t.timestamp :attachment_updated_at
      t.timestamps
    end
    add_index :assets, :user_id
  end
end
