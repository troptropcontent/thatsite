module Communication::Todo
    class BaseController < ApplicationController
        
        #PUT /todo/basic_info
        def basic_info
            site = current_user.sites.create!(site_params)
            new_to_do = BasicInfo.new(site)
            respond_to do |format|
             format.turbo_stream { render turbo_stream: turbo_stream.replace(new_to_do, partial: 'communication/todo/basic_info', locals: { todo: new_to_do}) }
            end
        end

        private

        def site_params
            params[:site].permit(:name)
        end
    end
end
