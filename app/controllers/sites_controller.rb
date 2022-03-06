# frozen_string_literal: true

class SitesController < ApplicationController
    before_action :authenticate_user!

    # member.thatsite.io/sites/new
    def new; end
end
