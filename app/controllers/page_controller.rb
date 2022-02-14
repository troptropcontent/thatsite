# frozen_string_literal: true

class PageController < ApplicationController
  before_action :load_page

  def show
    @page
    render @page.name, layout: 'page'
  end

  private

  def page_params
    params.permit(:name)
  end

  def load_page
    site_name = ['', 'www'].include?(request.subdomain) ? "thatsite" : request.subdomain
    site = Site.find_by!(name: site_name)
    @page = site.pages.find_by!(page_params)
  end
end
