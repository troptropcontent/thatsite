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
class Core::Pages::ContextDatum < ApplicationRecord
  belongs_to :holder, polymorphic: true
  belongs_to :context
  has_one :page, through: :context
  self.table_name = 'context_data'
end
