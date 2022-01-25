class Office < ApplicationRecord
  belongs_to :business
  has_many :business_hours
end
