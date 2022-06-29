# == Schema Information
#
# Table name: offices
#
#  id                 :bigint           not null, primary key
#  business_id        :bigint           not null
#  address_full       :string           not null
#  address_complement :string
#  address_zipcode    :string           not null
#  addresse_city      :string           not null
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  phone              :string
#
class Office < ApplicationRecord
  belongs_to :business
  has_many :business_hours
end
