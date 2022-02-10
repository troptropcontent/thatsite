class Section < ApplicationRecord
  belongs_to :page
  validates :name, uniqueness: { scope: :page_id }
end
