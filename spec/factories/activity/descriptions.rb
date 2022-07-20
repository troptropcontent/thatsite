# frozen_string_literal: true

# == Schema Information
#
# Table name: descriptions
#
#  id          :bigint           not null, primary key
#  content     :string           not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  business_id :bigint           not null
#
# Indexes
#
#  index_descriptions_on_business_id           (business_id)
#  index_descriptions_on_business_id_and_name  (business_id,name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (business_id => businesses.id)
#
module Activity
  FactoryBot.define do
    factory :description, class: 'Activity::Description' do
      content { 'MyString' }
      name { 'MyString' }
      business { Business.last || FactoryBot.create(:business) }
    end
  end
end
