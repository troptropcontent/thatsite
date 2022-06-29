# frozen_string_literal: true

# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  type       :string
#  site_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#
class Team < Page
  include IsDefaultPage
  DEFAULT_SECTIONS = %w[
    who_we_are_phrase
].freeze
end
