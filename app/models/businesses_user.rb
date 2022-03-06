# frozen_string_literal: true

class BusinessesUser < ApplicationRecord
  belongs_to :business
  belongs_to :user
end
