FactoryBot.define do
  factory :contact do
    site { Site.last || FactoryBot.create(:site)}
  end
end
