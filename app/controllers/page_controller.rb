# frozen_string_literal: true

class PageController < ApplicationController
  before_action :load_page_and_site

  def show
    # @content = load_content
    render @page.name, layout: 'page'
  end

  private

  def page_params
    params.permit(:name)
  end

  def load_page_and_site
    site_name = ['', 'www'].include?(request.subdomain) ? 'thatsite' : request.subdomain
    @site = Site.find_by!(name: site_name)
    @page = @site.pages.find_by!(page_params)
  end

  def load_content
    content_loader.new(@page).call
  end
end
