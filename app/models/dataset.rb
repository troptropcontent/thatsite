class Dataset < ApplicationRecord
  belongs_to :page
  has_one_attached :json

  def reload_json!
    DatasetJsonReloader.new(self).reload!
  end
end
