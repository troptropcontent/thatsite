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
class About < Page
    include IsDefaultPage 
    DEFAULT_SECTIONS = %w[
        what_we_do_phrase
        what_we_do_paragraph
    ].freeze
end
