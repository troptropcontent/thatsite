class DropBusinessesUsersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :businesses_users
  end
end
