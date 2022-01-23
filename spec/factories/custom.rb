FactoryBot.define do
  factory :custom do
    site { Site.last || FactoryBot.create(:site)}
  end
end
