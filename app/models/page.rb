# frozen_string_literal: true

# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint
#
# Indexes
#
#  index_pages_on_site_id  (site_id)
#
class Page < ApplicationRecord
  belongs_to :site
  validates :name, presence: true
  has_one :context
end
