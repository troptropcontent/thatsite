# == Schema Information
#
# Table name: font_pairs
#
#  id                :bigint           not null, primary key
#  link_tag_href     :string
#  primary           :string
#  primary_backup    :string
#  secondary         :string
#  secondary_back_up :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class FontPair < ApplicationRecord
    def self.all_names
        pluck(:primary).push(*pluck(:secondary)).uniq
    end
end
