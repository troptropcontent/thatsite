# frozen_string_literal: true

# == Schema Information
#
# Table name: font_pairs
#
#  id               :bigint           not null, primary key
#  link_tag_href    :string
#  primary          :string
#  primary_backup   :string
#  secondary        :string
#  secondary_backup :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'

module Core::Style
  RSpec.describe ColorPalette, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        first
        second
        third
        fourth
        fifth
        created_at
        updated_at
      ]
    end
  end
end
