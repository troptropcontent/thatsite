# frozen_string_literal: true

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
