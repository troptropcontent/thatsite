# frozen_string_literal: true

class Team < Page
  include IsDefaultPage
  DEFAULT_SECTIONS = %w[
    who_we_are_phrase
].freeze
end
