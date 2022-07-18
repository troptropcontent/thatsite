# frozen_string_literal: true

module Core::Pages
  class PagesController < ApplicationController
    skip_before_action :authenticate_user!
    def show
      @site = load_site
      @page = load_page
      render @page.name, layout: 'page'
    end

    private

    def page_params
      params.permit(:name)
    end

    def load_site
      site_name = ['', 'www'].include?(request.subdomain) ? 'thatsite' : request.subdomain
      Core::Site.find_by!(name: site_name)
    end

    def load_page
      @site.pages.find_by!(page_params)
    end
  end
end
