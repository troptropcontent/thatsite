FactoryBot.define do
  factory :team_member do
    first_name { "Tom" }
    last_name { "Ecrepont" }
    role { "BackEnd Engineer" }
    email { nil }
    business { Business.last || FactoryBot.create(:business) }
  end
end
