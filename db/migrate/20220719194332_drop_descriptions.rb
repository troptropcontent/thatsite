class DropDescriptions < ActiveRecord::Migration[7.0]
  def change
    drop_table :descriptions
  end
end
