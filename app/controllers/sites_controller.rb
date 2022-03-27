# frozen_string_literal: true

class SitesController < ApplicationController
    before_action :authenticate_user!

    # GET member.thatsite.io/sites/new
    def new
        @site = current_user.sites.new()
        @other_sites = current_user.sites.pluck(:name)
        @available_color_palettes = ColorPalette.all
        @available_font_pairs = FontPair.all
        @to_dos = Communication::Todo::Base.list(@site)
        render "form"
    end

    # GET member.thatsite.io/sites/:name/edit
    def edit
        @site = current_user.sites.find_by!(name: params[:name])
        @other_sites = current_user.sites.where.not(id: @site.id).pluck(:name)
        @available_color_palettes = ColorPalette.all
        @available_font_pairs = FontPair.all
        @to_dos = Communication::Todo::Base.list(@site)
        render "form"
    end

    # PUT member.thatsite.io/sites/:name
    def update
        @site = current_user.sites.find_by!(name: params[:name])
        @available_color_palettes = ColorPalette.all
        @available_font_pairs = FontPair.all
        respond_to do |format|
            @site.update(site_params)
            updated_to_do = turbo_stream_params[:klass].constantize.new(@site)
            format.turbo_stream { render turbo_stream: turbo_stream.replace(updated_to_do, partial: updated_to_do) }
        end
    end

    # POST member.thatsite.io/sites
    def create
        @site = Site.new(site_params)
        respond_to do |format|
            if @site.save
                current_user.sites << @site
                format.any(:html, :turbo_stream) { redirect_to edit_site_url(@site)}
            else
                updated_to_do = turbo_stream_params[:klass].constantize.new(@site)
                format.turbo_stream { render turbo_stream: turbo_stream.replace(updated_to_do, partial: updated_to_do) }
            end
        end
    end

    private

    def site_params
        params[:site].permit(:name, :color_palette_id, :font_pair_id)
    end

    def turbo_stream_params
        params[:turbo_stream].permit(:klass)
    end
end
