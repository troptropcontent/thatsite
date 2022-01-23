FactoryBot.define do
  factory :section do
    page { Page.last || FactoryBot.create(:home) }
    content { "Get the visibility you deserve" }
    name { "catch_phrase" }
  end
end
