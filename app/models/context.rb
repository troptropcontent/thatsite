# == Schema Information
#
# Table name: datasets
#
#  id         :bigint           not null, primary key
#  page_id    :bigint           not null
#  query      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Context < ApplicationRecord
  belongs_to :page
  has_one_attached :json

  def reload_json!
    DatasetJsonReloader.new(self).reload!
  end
end
