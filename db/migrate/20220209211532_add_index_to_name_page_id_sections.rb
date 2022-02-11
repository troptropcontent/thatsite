class AddIndexToNamePageIdSections < ActiveRecord::Migration[7.0]
  def change
    add_index :sections, [:page_id, :name], unique: true
  end
end
