# frozen_string_literal: true

# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint
#
# Indexes
#
#  index_pages_on_site_id  (site_id)
#
module Core
  module Pages
    FactoryBot.define do
      factory :page, class: 'Core::Pages::Page' do
        name { 'home' }
        site { Core::Site.last || FactoryBot.create(:site) }
      end
    end
  end
end
