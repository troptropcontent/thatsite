# frozen_string_literal: true

# == Schema Information
#
# Table name: font_pairs
#
#  id               :bigint           not null, primary key
#  link_tag_href    :string
#  primary          :string
#  primary_backup   :string
#  secondary        :string
#  secondary_backup :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

module Core::Style
  FactoryBot.define do
    factory :font_pair, class: 'Core::Style::FontPair' do
      link_tag_href { 'https://fonts.googleapis.com/css2?family=Commissioner:wght@300&family=Fraunces&display=swap' }
      primary { 'Fraunces' }
      primary_backup { 'serif' }
      secondary { 'Commissioner' }
      secondary_backup { 'sans-serif' }
    end
  end
end
