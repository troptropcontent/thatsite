# frozen_string_literal: true

class ContentBuilder
    def initialize(page)
      @page = page
    end
  
    def call
        {
            **static_content,
            **default_sections,
            **page_content,
        }
    end

    private

    def default_sections
        @page.class::DEFAULT_SECTIONS.each_with_object({}){|key, r| r[key] = nil }
    end

    def static_content
        I18n.t("pages.#{@page.class.to_s.downcase}.static_content").stringify_keys
    end

    def page_content
        @page.sections.pluck(:name, :content).to_h
    end
  end
  