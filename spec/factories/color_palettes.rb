# == Schema Information
#
# Table name: color_palettes
#
#  id         :bigint           not null, primary key
#  fifth      :string
#  first      :string
#  fourth     :string
#  second     :string
#  third      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :color_palette do
    first { "e63946" }
    second { "f1faee" }
    third { "a8dadc" }
    fourth { "457b9d" }
    fifth { "1d3557" }
  end
end
