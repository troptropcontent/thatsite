# frozen_string_literal: true

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
