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
  class BusinessHour < ApplicationRecord
    belongs_to :office
    enum weekday: {
      monday: 0,
      tuesday: 1,
      wednesday: 2,
      thursday: 3,
      friday: 4,
      saturday: 5,
      sunday: 6
    }

    validates :closes_at, presence: true
    validates :opens_at, presence: true
    validates :weekday, presence: true

    def public
      "#{opens_at.strftime('%H:%M')} - #{closes_at.strftime('%H:%M')}"
    end
  end
end
