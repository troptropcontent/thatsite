class AddUniqueIndexOnBusinessIdAndNameInDescriptions < ActiveRecord::Migration[7.0]
  def change
    add_index :descriptions, [:business_id, :name], unique: true
  end
end
