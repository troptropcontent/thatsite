class Page < ApplicationRecord
    belongs_to :site
    validates :name, presence: true
end