FactoryBot.define do
  factory :site do
    name{"test"}
    color_palette { ColorPalette.last || FactoryBot.create(:color_palette) }
    font_pair { FontPair.last || FactoryBot.create(:font_pair) }
    business { Business.last || FactoryBot.create(:business)}
  end
end
