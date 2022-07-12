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
FactoryBot.define do
  factory :office do
    business { Business.last || FactoryBot.create(:business) }
    address_full { "38 rue ordener" }
    address_complement { nil }
    address_zipcode { "75018" }
    addresse_city { "Paris" }
    name { nil }
  end
end
