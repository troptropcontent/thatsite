# frozen_string_literal: true

# == Schema Information
#
# Table name: sites
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  color_palette_id :bigint
#  font_pair_id     :bigint
#
# Indexes
#
#  index_sites_on_color_palette_id  (color_palette_id)
#  index_sites_on_font_pair_id      (font_pair_id)
#  index_sites_on_name              (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (color_palette_id => color_palettes.id)
#  fk_rails_...  (font_pair_id => font_pairs.id)
#
require 'rails_helper'
require 'support/shared_example/models/should_have_database_colums'

module Core
  RSpec.describe Site, type: :model do
    describe 'columns' do
      it_behaves_like 'it should have database columns', %w[
        id
        name
        color_palette_id
        font_pair_id
        created_at
        updated_at
      ]
    end

    describe 'validation' do
      context 'name' do
        context 'format' do
          before { subject.name = 1234 }
          it 'only accepts dashes and letters' do
            expect(subject).to be_invalid
            expect(subject.errors.full_messages).to eq(
              ['Nom ne peut contenir que des lettres minuscules et des tirets']
            )
          end
        end
        context 'uniqueness' do
          before do
            test_site = FactoryBot.create(:site, name: 'test')
            subject.name = test_site.name
          end
          it 'Only accepts a name if it is unique' do
            expect(subject).to be_invalid
            expect(subject.errors.full_messages).to eq(['Nom est déjà utilisé(e)'])
          end
        end
      end
    end
  end
end
