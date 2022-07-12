# == Schema Information
#
# Table name: offices
#
#  id                 :bigint           not null, primary key
#  address_complement :string
#  address_full       :string           not null
#  address_zipcode    :string           not null
#  addresse_city      :string           not null
#  name               :string
#  phone              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_id        :bigint           not null
#
# Indexes
#
#  index_offices_on_business_id  (business_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_id => businesses.id)
#
class Office < ApplicationRecord
  belongs_to :business
  has_many :business_hours
end
