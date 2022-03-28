class RemoveNullFromColorPaletteAndFontPairInSites < ActiveRecord::Migration[7.0]
  def change
    change_column_null :sites, :color_palette_id, true
    change_column_null :sites, :font_pair_id, true
  end
end
