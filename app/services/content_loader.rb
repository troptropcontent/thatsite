# frozen_string_literal: true

class ContentLoader
    def initialize(page)
      @page = page
    end
  
    def call
        
    
    end

    private

    def default_sections
        @page.class::DEFAULT_SECTIONS
    end
  end
  