# frozen_string_literal: true

# == Schema Information
#
# Table name: texts
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint           not null
#
# Indexes
#
#  index_texts_on_site_id  (site_id)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#
require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'
require 'support/shared_example/models/should_have_active_record_validations'

module Core
  RSpec.describe Text, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        name
        content
        site_id
        created_at
        updated_at
      ]
    end

    describe 'validations' do
      it_behaves_like 'it should have presence validation', %w[
        name
        content
      ]
    end
  end
end
