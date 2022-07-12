# == Schema Information
#
# Table name: texts
#
#  id         :bigint           not null, primary key
#  content    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint           not null
#
# Indexes
#
#  index_texts_on_site_id  (site_id)
#
# Foreign Keys
#
#  fk_rails_...  (site_id => sites.id)
#
require 'rails_helper'

RSpec.describe Text, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
