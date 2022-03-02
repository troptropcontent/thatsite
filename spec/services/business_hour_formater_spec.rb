# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BusinessHourFormater do
  describe '#call' do
    let(:office) { FactoryBot.create(:office) }
    let!(:monday_business_hours) do
      FactoryBot.create(
        :business_hour,
        office: office,
        weekday: :monday,
        opens_at: Time.current.change(hour: 9),
        closes_at: Time.current.change(hour: 18)
      )
    end
    let!(:tuesday_business_hours) do
      FactoryBot.create(
        :business_hour,
        office: office,
        weekday: :tuesday,
        opens_at: Time.current.change(hour: 14),
        closes_at: Time.current.change(hour: 19)
      )
    end
    let!(:wednesday_morning_business_hours) do
      FactoryBot.create(
        :business_hour,
        office: office,
        weekday: :wednesday,
        opens_at: Time.current.change(hour: 9),
        closes_at: Time.current.change(hour: 12)
      )
    end

    let!(:wednesday_afternoon_business_hours) do
      FactoryBot.create(
        :business_hour,
        office: office,
        weekday: :wednesday,
        opens_at: Time.current.change(hour: 14),
        closes_at: Time.current.change(hour: 19)
      )
    end

    let(:expected) do
      [
        'Lundi: 09:00 - 18:00',
        'Mardi: 14:00 - 19:00',
        'Mercredi: 09:00 - 12:00 14:00 - 19:00',
        'Jeudi: fermé',
        'Vendredi: fermé',
        'Samedi: fermé',
        'Dimanche: fermé'
      ]
    end

    it 'returns an array of formatized business_hours ready to be inserted to the view' do
      expect(described_class.new(office).call).to eq(expected)
    end
  end
end
