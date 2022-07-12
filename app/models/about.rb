# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :bigint
#
# Indexes
#
#  index_pages_on_site_id  (site_id)
#
class About < Page
    include IsDefaultPage 
    DEFAULT_SECTIONS = %w[
        what_we_do_phrase
        what_we_do_paragraph
    ].freeze
end
