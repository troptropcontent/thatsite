# frozen_string_literal: true

# == Schema Information
#
# Table name: context_data
#
#  id          :bigint           not null, primary key
#  holder_type :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  context_id  :bigint           not null
#  holder_id   :bigint           not null
#
# Indexes
#
#  index_context_data_on_context_id  (context_id)
#  index_context_data_on_holder      (holder_type,holder_id)
#
# Foreign Keys
#
#  fk_rails_...  (context_id => contexts.id)
#
FactoryBot.define do
  factory :context_datum, class: 'Core::Pages::ContextDatum' do
    holder { Core::Text }
    context { Context.last || FactoryBot.create(:context) }
  end
end
