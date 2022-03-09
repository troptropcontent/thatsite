# frozen_string_literal: true

class SitesController < ApplicationController
    before_action :authenticate_user!

    # GET member.thatsite.io/sites/new
    def new
        @site = current_user.sites.new() 
        @to_dos = Communication::Todo::Base.list(@site)
    end

    # GET member.thatsite.io/sites/:name/edit
    def edit
        @site = current_user.sites.find_by!(site_params)
        @to_dos = Communication::Todo::Base.list(@site)
    end

    private

    def site_params
        params.permit(:name)
    end
end
