# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    site { Site.last || FactoryBot.create(:site) }
  end
end
