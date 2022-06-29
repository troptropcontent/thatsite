# == Schema Information
#
# Table name: color_palettes
#
#  id         :bigint           not null, primary key
#  first      :string
#  second     :string
#  third      :string
#  fourth     :string
#  fifth      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ColorPalette < ApplicationRecord
end
