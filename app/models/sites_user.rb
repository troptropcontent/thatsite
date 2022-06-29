# frozen_string_literal: true

# == Schema Information
#
# Table name: sites_users
#
#  site_id :bigint           not null
#  user_id :bigint           not null
#
class SitesUser < ApplicationRecord
  belongs_to :site
  belongs_to :user
end
