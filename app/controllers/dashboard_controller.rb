# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!
  # member.thasite.io or member.thasite.io/:name
  def show
    redirect_to new_site_path if current_user.sites.empty?
  end
end
