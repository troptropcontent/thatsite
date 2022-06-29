# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  type       :string
#  site_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#
class Custom < Page
    
end
