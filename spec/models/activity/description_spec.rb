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

require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'
require 'support/shared_example/models/should_have_active_record_validations'

module Activity
  RSpec.describe Activity::Description, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        content
        name
        created_at
        updated_at
        business_id
      ]
    end

    describe 'validations' do
      context 'presence' do
        it_behaves_like 'it should have presence validation', %w[
          content
          name
        ]
      end

      context 'uniqueness' do
        let(:business) { FactoryBot.create(:business) }
        let!(:first_description) { FactoryBot.create(:description, business: business, name: 'test') }
        it 'can only be one name per business_id' do
          expect(described_class.new(business: business, name: 'test')).to be_invalid
        end
      end
    end
  end
end
