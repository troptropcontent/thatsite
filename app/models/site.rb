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
class Site < ApplicationRecord
  belongs_to :color_palette, optional: true
  belongs_to :font_pair, optional: true
  has_many :sites_user, dependent: :destroy
  has_many :users, through: :sites_user
  has_one :business, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :texts, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-z-]+\z/ }

  def to_param
    name
  end
end
