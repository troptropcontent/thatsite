# frozen_string_literal: true

# == Schema Information
#
# Table name: color_palettes
#
#  id         :bigint           not null, primary key
#  fifth      :string
#  first      :string
#  fourth     :string
#  second     :string
#  third      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
