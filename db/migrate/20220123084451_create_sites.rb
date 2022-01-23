class CreateSites < ActiveRecord::Migration[7.0]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  def change
    create_table :sites, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :color_palette, null: false, foreign_key: true
      t.references :font_pair, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end

