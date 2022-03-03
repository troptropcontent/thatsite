class About < Page
    include IsDefaultPage 
    DEFAULT_SECTIONS = %w[
        what_we_do_phrase
        what_we_do_paragraph
    ].freeze
end
