module Communication::Todo
    class BaseController < ApplicationController
        
        #PUT /todo/basic_info
        def basic_info
            @site = Site.new(site_params)
            respond_to do |format|
                if @site.save
                    link_site_to_user
                    format.turbo_stream { redirect_to edit_site_path(@site.name)  }
                else
                    new_to_do = BasicInfo.new(@site)
                    format.turbo_stream { render turbo_stream: turbo_stream.replace(new_to_do, partial: 'communication/todo/basic_info', locals: { todo: new_to_do, errors: [I18n.t("todos.basic_infos.errors.invalid_name")]}) }
                end
            end
        end

        private

        def site_params
            params[:site].permit(:name)
        end

        def link_site_to_user
            current_user.sites << @site
        end
    end
end
