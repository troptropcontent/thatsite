# frozen_string_literal: true

# == Schema Information
#
# Table name: sites_users
#
#  site_id :bigint           not null
#  user_id :bigint           not null
#
# Indexes
#
#  index_sites_users_on_site_id  (site_id)
#  index_sites_users_on_user_id  (user_id)
#
class SitesUser < ApplicationRecord
  belongs_to :site
  belongs_to :user
end
