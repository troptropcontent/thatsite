# == Schema Information
#
# Table name: team_members
#
#  id          :bigint           not null, primary key
#  email       :string
#  first_name  :string           not null
#  last_name   :string           not null
#  role        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  business_id :bigint           not null
#
# Indexes
#
#  index_team_members_on_business_id  (business_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_id => businesses.id)
#
FactoryBot.define do
  factory :team_member do
    first_name { "Tom" }
    last_name { "Ecrepont" }
    role { "BackEnd Engineer" }
    email { nil }
    business { Business.last || FactoryBot.create(:business) }
  end
end
