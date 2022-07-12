# frozen_string_literal: true

# == Schema Information
#
# Table name: datasets
#
#  id         :bigint           not null, primary key
#  query      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page_id    :bigint           not null
#
# Indexes
#
#  index_datasets_on_page_id  (page_id)
#
# Foreign Keys
#
#  fk_rails_...  (page_id => pages.id)
#
class Context < ApplicationRecord
  belongs_to :page
  has_one_attached :json

  def reload_json!
    DatasetJsonReloader.new(self).reload!
  end
end
