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
module Activity
  FactoryBot.define do
    factory :business_hour, class: 'Activity::BusinessHour' do
      office { Office.last || FactoryBot.create(:office) }
      weekday { 1 }
      opens_at { '2022-01-25 09:00:00' }
      closes_at { '2022-01-25 20:00:00' }
    end
  end
end
