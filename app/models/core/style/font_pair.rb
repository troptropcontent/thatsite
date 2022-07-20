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
  class FontPair < ApplicationRecord
  end
end
