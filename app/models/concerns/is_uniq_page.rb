module IsUniqPage
    extend ActiveSupport::Concern

    included do
        validates :type, uniqueness: { scope: :site,
            message: "there can only be one page of this type per site" }
    end
end