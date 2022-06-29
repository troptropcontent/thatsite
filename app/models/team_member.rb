# == Schema Information
#
# Table name: team_members
#
#  id          :bigint           not null, primary key
#  first_name  :string           not null
#  last_name   :string           not null
#  role        :string           not null
#  email       :string
#  business_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TeamMember < ApplicationRecord
  belongs_to :business
end
