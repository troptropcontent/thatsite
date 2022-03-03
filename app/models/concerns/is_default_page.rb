module IsDefaultPage
    extend ActiveSupport::Concern

    included do
        before_validation do 
            assign_attributes name: type.downcase
        end

        validates :type, uniqueness: { scope: :site,
            message: "there can only be one page of this type per site" }

        def default?
            true
        end
    end
end