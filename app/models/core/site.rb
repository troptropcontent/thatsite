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
  class Site < ApplicationRecord
    belongs_to :color_palette, class_name: 'Core::Style::ColorPalette', optional: true
    belongs_to :font_pair, class_name: 'Core::Style::FontPair', optional: true
    # rubocop:disable Rails/HasAndBelongsToMany
    has_and_belongs_to_many :users
    # rubocop:enable Rails/HasAndBelongsToMany
    has_one :business, class_name: 'Activity::Business', dependent: :destroy
    has_many :pages, class_name: 'Core::Pages::Page', dependent: :destroy
    has_many :texts, class_name: 'Core::Text', dependent: :destroy

    validates :name, uniqueness: true
    validates :name, format: { with: /\A[a-z-]+\z/ }
  end
end
