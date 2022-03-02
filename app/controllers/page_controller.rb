# frozen_string_literal: true

class PageController < ApplicationController

  def show
    @site = load_site
    @page = load_page
    @content = build_content
    render @page.name, layout: 'page'
  end

  private

  def page_params
    params.permit(:name)
  end

  def load_site
    site_name = ['', 'www'].include?(request.subdomain) ? 'thatsite' : request.subdomain
    Site.find_by!(name: site_name)
  end

  def load_page
    @site.pages.find_by!(page_params)
  end

  def build_content
    ContentBuilder.new(@page).call
  end
end
