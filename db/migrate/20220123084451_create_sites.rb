class CreateSites < ActiveRecord::Migration[7.0]
  
  def change
    create_table :sites do |t|
      t.references :color_palette, null: false, foreign_key: true
      t.references :font_pair, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end

