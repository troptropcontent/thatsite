class CreateUserSiteJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :sites, :users do |t|
      t.index :site_id
      t.index :user_id
    end
  end
end
