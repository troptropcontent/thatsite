# frozen_string_literal: true

class ContentBuilder
    def initialize(page)
      @page = page
    end
  
    def call
        {
            **default_cotent,
            **page_content,
        }
    end

    private

    def default_sections
        @page.class::DEFAULT_SECTIONS.each_with_object({}){|key, r| r[key] = nil }
    end

    def static_sections
        I18n.t("pages.#{@page.name}.static_sections").stringify_keys
    end

    def default_cotent
        return {} unless @page.default?
        {
            **static_sections,
            **default_sections,
        }
    end


    def page_content
        @page.sections.pluck(:name, :content).to_h
    end
  end
  