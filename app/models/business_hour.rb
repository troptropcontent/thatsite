# frozen_string_literal: true

# == Schema Information
#
# Table name: business_hours
#
#  id         :bigint           not null, primary key
#  office_id  :bigint           not null
#  weekday    :integer          not null
#  opens_at   :time             not null
#  closes_at  :time             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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

  def public
    "#{opens_at.strftime('%H:%M')} - #{closes_at.strftime('%H:%M')}"
  end
end
