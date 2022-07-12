# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  content    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page_id    :bigint           not null
#
# Indexes
#
#  index_sections_on_page_id           (page_id)
#  index_sections_on_page_id_and_name  (page_id,name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (page_id => pages.id)
#
class Section < ApplicationRecord
  belongs_to :page
  validates :name, uniqueness: { scope: :page_id }
end
