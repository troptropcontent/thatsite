FactoryBot.define do
  factory :site do
    color_palette { ColorPalette.last || FactoryBot.create(:color_palette) }
    font_pair { FontPair.last || FactoryBot.create(:font_pair) }
    business { Business.last || FactoryBot.create(:business)}
    name {"test_1"}
  end
end
