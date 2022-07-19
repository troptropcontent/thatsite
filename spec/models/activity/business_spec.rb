# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'
require 'support/shared_example/models/should_have_active_record_validations'

module Activity
  RSpec.describe Business, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        name
        created_at
        updated_at
        site_id
      ]
    end

    describe 'validations' do
      it_behaves_like 'it should have presence validation', %w[
        name
      ]
    end
  end
end
