class Site < ApplicationRecord
  belongs_to :color_palette, optional: true
  belongs_to :font_pair, optional: true
  has_one :business
  has_many :pages
end
