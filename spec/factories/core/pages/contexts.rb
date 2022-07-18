# frozen_string_literal: true

module Core
  module Pages
    FactoryBot.define do
      factory :context, class: 'Core::Pages::Context' do
        query { 'a query' }
        page { Page.last || FactoryBot.create(:page) }
      end
    end
  end
end
