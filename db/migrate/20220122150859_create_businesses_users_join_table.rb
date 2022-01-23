class CreateBusinessesUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :businesses, :users do |t|
      t.index :business_id
      t.index :user_id
    end
  end
end
