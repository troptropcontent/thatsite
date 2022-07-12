class ChangeDatasetIntoContext < ActiveRecord::Migration[7.0]
  def change
    rename_table :datasets, :contexts
  end
end
