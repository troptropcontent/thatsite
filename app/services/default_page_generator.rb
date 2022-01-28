# frozen_string_literal: true

class DefaultPageGenerator
  def initialize(page)
    @page = page
  end

  def call!
    {
      template: 'default template',
      data: 'everything that needs to be passed to the page'
    }
  end
end
