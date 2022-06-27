# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :site
  validates :name, presence: true
  has_many :sections
  has_one :dataset
  
  DEFAULT_SECTIONS = %w[].freeze

  def default?
    false
  end

end
