# frozen_string_literal: true

class PageController < ApplicationController
  before_action :find_page

  def show
    @data = show_service.new(@page).call!
  end

  private

  def page_params
    params.permit(:site_id, :name)
  end

  def find_page
    @page = Page.find_by(page_params)
  end

  def show_service
    @page.instance_of?(Custom) ? CustomPageGenerator : DefaultPageGenerator
  end
end
