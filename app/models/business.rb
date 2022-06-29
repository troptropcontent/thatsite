# frozen_string_literal: true

# == Schema Information
#
# Table name: businesses
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint
#
class Business < ApplicationRecord
  has_many :offices
  belongs_to :site
end
