# frozen_string_literal: true

# == Schema Information
#
# Table name: businesses
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint
#
# Indexes
#
#  index_businesses_on_site_id  (site_id)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#
module Activity
  FactoryBot.define do
    factory :business, class: 'Activity::Business' do
      name { 'MyCompany' }
      site { Core::Site.last || create(:site) }
    end
  end
end
