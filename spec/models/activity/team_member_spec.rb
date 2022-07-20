# frozen_string_literal: true

# == Schema Information
#
# Table name: team_members
#
#  id          :bigint           not null, primary key
#  email       :string
#  first_name  :string           not null
#  last_name   :string           not null
#  role        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  business_id :bigint           not null
#
# Indexes
#
#  index_team_members_on_business_id  (business_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_id => businesses.id)
#
require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'
require 'support/shared_example/models/should_have_active_record_validations'

module Activity
  RSpec.describe TeamMember, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        email
        first_name
        last_name
        role
        created_at
        updated_at
        business_id
      ]
    end

    describe 'validations' do
      it_behaves_like 'it should have presence validation', %w[
        first_name
        last_name
        role
      ]
    end
  end
end
