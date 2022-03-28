# frozen_string_literal: true

class Business < ApplicationRecord
  has_many :offices
  belongs_to :site
end
