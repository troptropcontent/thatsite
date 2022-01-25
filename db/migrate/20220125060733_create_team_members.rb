class CreateTeamMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :team_members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :role, null: false
      t.string :email
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
