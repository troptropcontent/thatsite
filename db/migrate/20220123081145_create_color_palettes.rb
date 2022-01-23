class CreateColorPalettes < ActiveRecord::Migration[7.0]
  def change
    create_table :color_palettes do |t|
      t.string :first
      t.string :second
      t.string :third
      t.string :fourth
      t.string :fifth

      t.timestamps
    end
  end
end
