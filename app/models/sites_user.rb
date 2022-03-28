# frozen_string_literal: true

class SitesUser < ApplicationRecord
  belongs_to :site
  belongs_to :user
end
