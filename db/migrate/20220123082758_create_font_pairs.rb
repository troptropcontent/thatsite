class CreateFontPairs < ActiveRecord::Migration[7.0]
  def change
    create_table :font_pairs do |t|
      t.string :link_tag_href
      t.string :primary
      t.string :primary_backup
      t.string :secondary
      t.string :secondary_back_up

      t.timestamps
    end
  end
end
