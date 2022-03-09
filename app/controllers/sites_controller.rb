# frozen_string_literal: true

class SitesController < ApplicationController
    before_action :authenticate_user!
    before_action :load_site

    # GET member.thatsite.io/sites/new
    def new
        @to_dos = Communication::Todo::Base.list(@site)
    end

    # GET member.thatsite.io/sites/:name/edit
    def edit
        @to_dos = Communication::Todo::Base.list(@site)
    end

    private

    def load_site         
       if site_params.present?
            @site ||= current_user.sites.find_by!(site_params)
       else
             @site = current_user.sites.new() 
       end 
    end

    def site_params
        params.permit(:name)
    end
end
