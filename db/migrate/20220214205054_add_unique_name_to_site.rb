class AddUniqueNameToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :name, :string, unique: true, null: false
  end
end
