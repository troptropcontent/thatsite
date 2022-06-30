# frozen_string_literal: true

FactoryBot.define do
  factory :site do
    name { 'test' }
    color_palette { ColorPalette.last || FactoryBot.create(:color_palette) }
    font_pair { FontPair.last || FactoryBot.create(:font_pair) }
  end
end
