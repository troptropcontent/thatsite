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

