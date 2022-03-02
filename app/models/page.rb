# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :site
  validates :name, presence: true
  has_many :sections

  DEFAULT_SECTIONS = %w[].freeze

end
