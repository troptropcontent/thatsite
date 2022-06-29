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
class Home < Page
    include IsDefaultPage
    DEFAULT_SECTIONS = %w[
        banner_title
        banner_text
        what_we_believe_in_text
        who_we_are_text
        what_we_do_text
    ].freeze
end

