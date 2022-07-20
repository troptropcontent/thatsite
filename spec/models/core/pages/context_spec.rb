# frozen_string_literal: true

# == Schema Information
#
# Table name: contexts
#
#  id         :bigint           not null, primary key
#  query      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page_id    :bigint           not null
#
# Indexes
#
#  index_contexts_on_page_id  (page_id)
#
# Foreign Keys
#
#  fk_rails_...  (page_id => pages.id)
#
require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'
require 'support/shared_example/models/should_have_active_record_validations'

module Core::Pages
  RSpec.describe Context, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        query
        page_id
        created_at
        updated_at
      ]
    end

    describe 'validations' do
      it_behaves_like 'it should have presence validation', %w[
        query
      ]
    end
  end
end
