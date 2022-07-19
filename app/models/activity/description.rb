# frozen_string_literal: true

# == Schema Information
#
# Table name: descriptions
#
#  id          :bigint           not null, primary key
#  content     :string           not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  business_id :bigint           not null
#
# Indexes
#
#  index_descriptions_on_business_id           (business_id)
#  index_descriptions_on_business_id_and_name  (business_id,name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (business_id => businesses.id)
#
class Activity::Description < ApplicationRecord
  belongs_to :business
  validates :content, presence: true
  validates :name, presence: true
  validates :name, uniqueness: { scope: :business_id }
end
