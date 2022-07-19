# frozen_string_literal: true

# == Schema Information
#
# Table name: offices
#
#  id                 :bigint           not null, primary key
#  address_city       :string           not null
#  address_complement :string
#  address_country    :string           not null
#  address_full       :string           not null
#  address_zipcode    :string           not null
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
module Activity
  class Office < ApplicationRecord
    belongs_to :business
    has_many :business_hours, dependent: :destroy
    validates :address_full, presence: true
    validates :address_zipcode, presence: true
    validates :address_city, presence: true
    validates :address_country, presence: true
  end
end
