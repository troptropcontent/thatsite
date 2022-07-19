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
require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'
require 'support/shared_example/models/should_have_active_record_validations'

module Activity
  RSpec.describe Office, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        address_complement
        address_full
        address_zipcode
        address_city
        name
        phone
        created_at
        updated_at
        business_id
      ]
    end

    describe 'validations' do
      it_behaves_like 'it should have presence validation', %w[
        address_full
        address_zipcode
        address_city
        address_country
      ]
    end
  end
end
