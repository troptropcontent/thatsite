# frozen_string_literal: true

class Business < ApplicationRecord
  has_many :offices
  has_many :sites
end
