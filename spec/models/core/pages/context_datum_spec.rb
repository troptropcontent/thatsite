# frozen_string_literal: true

# == Schema Information
#
# Table name: context_data
#
#  id          :bigint           not null, primary key
#  holder_type :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  context_id  :bigint           not null
#  holder_id   :bigint           not null
#
# Indexes
#
#  index_context_data_on_context_id  (context_id)
#  index_context_data_on_holder      (holder_type,holder_id)
#
# Foreign Keys
#
#  fk_rails_...  (context_id => contexts.id)
#
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
