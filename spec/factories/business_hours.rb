FactoryBot.define do
  factory :business_hour do
    office { Office.last || FactoryBot.create(:office) }
    weekday { 1 }
    opens_at { "2022-01-25 09:00:00" }
    closes_at { "2022-01-25 20:00:00" }
  end
end
