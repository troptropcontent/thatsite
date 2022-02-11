FactoryBot.define do
  factory :home do
    site { Site.last || FactoryBot.create(:site)}
  end
end
