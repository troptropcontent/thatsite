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
  FactoryBot.define do
    factory :office, class: 'Activity::Office' do
      business { Business.last || FactoryBot.create(:business) }
      address_full { '38 rue ordener' }
      address_complement { nil }
      address_zipcode { '75018' }
      address_city { 'Paris' }
      address_country { 'FR' }
      name { nil }
    end
  end
end
