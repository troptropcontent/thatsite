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
class TeamMember < ApplicationRecord
  belongs_to :business
end
