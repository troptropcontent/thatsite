# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'
require 'support/shared_example/models/should_have_active_record_validations'

module Core::Pages
  RSpec.describe ContextDatum, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        holder_type
        holder_id
        context_id
        created_at
        updated_at
      ]
    end
  end
end
