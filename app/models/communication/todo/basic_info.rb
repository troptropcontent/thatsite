# frozen_string_literal: true

module Communication::Todo 
    class BasicInfo < Base

        def initialize(site)
            super
            @name = "basic_info"
            @order = 1
        end

        private

        def find_availability
            true
        end

        def find_inputs
            {
                site_name: @site&.name
            }
        end
    end
end
  