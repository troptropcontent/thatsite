# frozen_string_literal: true

# == Schema Information
#
# Table name: business_hours
#
#  id         :bigint           not null, primary key
#  closes_at  :time             not null
#  opens_at   :time             not null
#  weekday    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  office_id  :bigint           not null
#
# Indexes
#
#  index_business_hours_on_office_id  (office_id)
#
# Foreign Keys
#
#  fk_rails_...  (office_id => offices.id)
#
require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'
require 'support/shared_example/models/should_have_active_record_validations'

module Activity
  RSpec.describe BusinessHour, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        closes_at
        opens_at
        weekday
        created_at
        updated_at
        office_id
      ]
    end

    describe 'validations' do
      it_behaves_like 'it should have presence validation', %w[
        closes_at
        opens_at
        weekday
      ]
    end
  end
end
