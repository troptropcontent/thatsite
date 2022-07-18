# frozen_string_literal: true

# == Schema Information
#
# Table name: sites
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  color_palette_id :bigint
#  font_pair_id     :bigint
#
# Indexes
#
#  index_sites_on_color_palette_id  (color_palette_id)
#  index_sites_on_font_pair_id      (font_pair_id)
#  index_sites_on_name              (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (color_palette_id => color_palettes.id)
#  fk_rails_...  (font_pair_id => font_pairs.id)
#
module Core
  FactoryBot.define do
    factory :site, class: 'Core::Site' do
      name { 'test' }
      color_palette { ColorPalette.last || FactoryBot.create(:color_palette) }
      font_pair { FontPair.last || FactoryBot.create(:font_pair) }
    end
  end
end
