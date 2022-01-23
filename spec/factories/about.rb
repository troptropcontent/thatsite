FactoryBot.define do
  factory :about do
    site { Site.last || FactoryBot.create(:site)}
  end
end
