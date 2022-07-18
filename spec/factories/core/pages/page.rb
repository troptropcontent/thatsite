# frozen_string_literal: true

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
