class Site < ApplicationRecord
  belongs_to :color_palette
  belongs_to :font_pair
  belongs_to :business
  has_many :pages
end
