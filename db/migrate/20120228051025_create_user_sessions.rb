class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.string :login
      t.string :password
      t.integer :remember_me
      t.timestamps
    end
  end
end
