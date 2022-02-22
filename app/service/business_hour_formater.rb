# frozen_string_literal: true

class BusinessHourFormater
  def initialize(office)
    @office = office
  end

  def call
    BusinessHour.weekdays.keys.map do |weekday|
      "#{I18n.t "business_hours.enum.weekday.#{weekday}"}: #{stringified_hours(weekday)}"
    end
  end

  private

  def stringified_hours(weekday)
    business_hours = @office.business_hours.send(weekday.to_sym)
    return I18n.t 'business_hours.closed' if business_hours.empty?

    business_hours.map(&:public).join(' ')
  end
end
