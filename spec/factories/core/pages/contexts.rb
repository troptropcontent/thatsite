# frozen_string_literal: true

# == Schema Information
#
# Table name: contexts
#
#  id         :bigint           not null, primary key
#  query      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page_id    :bigint           not null
#
# Indexes
#
#  index_contexts_on_page_id  (page_id)
#
# Foreign Keys
#
#  fk_rails_...  (page_id => pages.id)
#
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
