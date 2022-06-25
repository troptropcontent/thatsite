class CreateTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :texts do |t|
      t.references :site, null: false, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
