# == Schema Information
#
# Table name: texts
#
#  id         :bigint           not null, primary key
#  site_id    :bigint           not null
#  name       :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Text < ApplicationRecord
  belongs_to :site
end
