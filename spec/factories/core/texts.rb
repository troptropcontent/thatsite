# frozen_string_literal: true

# == Schema Information
#
# Table name: texts
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint           not null
#
# Indexes
#
#  index_texts_on_site_id  (site_id)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#
module Core
  FactoryBot.define do
    factory :text, class: 'Core::Text' do
      site { Site.last || FactoryBot.create(:site) }
      content { 'Qui sommes nous ?' }
      name { 'who_we_are' }
    end
  end
end
