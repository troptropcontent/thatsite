# frozen_string_literal: true

module Communication::Todo 
    class Theme < Base
        def initialize(site)
            super
            @order = 2
        end

        private

        def find_availability
            BasicInfo.new(@site).status == "done"
        end

        def find_inputs
            {
                site_font_pair: @site.font_pair,
                site_color_palette: @site.color_palette
            }
        end

    end
end
  