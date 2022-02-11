FactoryBot.define do
  factory :office do
    business { Business.last || FactoryBot.create(:business) }
    address_full { "38 rue ordener" }
    address_complement { nil }
    address_zipcode { "75018" }
    addresse_city { "Paris" }
    name { nil }
  end
end
