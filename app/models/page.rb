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
