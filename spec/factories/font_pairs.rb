# frozen_string_literal: true

# == Schema Information
#
# Table name: font_pairs
#
#  id                :bigint           not null, primary key
#  link_tag_href     :string
#  primary           :string
#  primary_backup    :string
#  secondary         :string
#  secondary_back_up :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :font_pair do
    link_tag_href { 'https://fonts.googleapis.com/css2?family=Commissioner:wght@300&family=Fraunces&display=swap' }
    primary { 'Fraunces' }
    primary_backup { 'serif' }
    secondary { 'Commissioner' }
    secondary_back_up { 'sans-serif' }
  end
end
