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
module Core::Pages
  class Context < ApplicationRecord
    belongs_to :page
    has_one_attached :json
    validates :query, presence: true
  end
end
