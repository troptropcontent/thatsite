# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'
require 'support/shared_example/models/should_have_active_record_validations'

module Core::Pages
  RSpec.describe Page, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        name
        site_id
        created_at
        updated_at
      ]
    end

    describe 'validations' do
      it_behaves_like 'it should have presence validation', %w[
        name
      ]
    end
  end
end
