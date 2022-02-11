# frozen_string_literal: true

class PageController < ApplicationController
  before_action :load_page

  def show
    @page
    render @page.name, layout: 'page'
  end

  private

  def page_params
    params.permit(:site_id, :name)
  end

  def load_page
    @page = Page.find_by!(page_params)
  end
end
