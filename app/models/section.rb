# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  page_id    :bigint           not null
#  content    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Section < ApplicationRecord
  belongs_to :page
  validates :name, uniqueness: { scope: :page_id }
end
