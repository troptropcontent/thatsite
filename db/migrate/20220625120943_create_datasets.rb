class CreateDatasets < ActiveRecord::Migration[7.0]
  def change
    create_table :datasets do |t|
      t.references :page, null: false, foreign_key: true
      t.text :query

      t.timestamps
    end
  end
end
