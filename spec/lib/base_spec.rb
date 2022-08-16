# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Serializer do
  let(:subject) { Core::SiteBlueprint.render_as_hash(Core::Site.all, includes: includes_option) }
  let(:includes_option) { nil }
  let(:first_site) { FactoryBot.create(:site, name: 'first-site') }
  let!(:first_business) { FactoryBot.create(:business, site: first_site, name: 'first business') }
  let(:second_site) { FactoryBot.create(:site, name: 'second-site') }
  let!(:second_business) { FactoryBot.create(:business, site: second_site, name: 'second business') }
  context '#render_as_hash' do
    context 'when no includes are provided' do
      let(:expected) { [{}, {}] }
      it 'returns an array of empty hashes' do
        expect(subject).to eq(expected)
      end
    end
    context 'when includes are povided' do
      let(:includes_option) { :name }
      let(:expected) { [{ name: 'first-site' }, { name: 'second-site' }] }
      it 'returns an array of empty hashes' do
        expect(subject).to eq(expected)
      end

      context 'with association' do
        let(:includes_option) { [:name, { business: :name }] }
        let(:expected) do
          [
            {
              name: 'first-site',
              business: { name: 'first business' }
            },
            {
              name: 'second-site',
              business: { name: 'second business' }
            }
          ]
        end
        it 'includes only the fields includes in the params' do
          expect(subject).to eq(expected)
        end
      end

      context 'with a field that does not exist in the serializer' do
        let(:includes_option) { %i[name foo] }
        let(:expected) { [{ name: 'first-site' }, { name: 'second-site' }] }
        it 'returns only the available fields' do
          expect(subject).to eq(expected)
        end
      end

      context 'with a complex association structure' do
        let!(:first_office) { FactoryBot.create(:office, business: first_business, name: 'first office') }
        let(:includes_option) { [:name, { business: [:name, { offices: :name }] }] }
        let(:expected) do
          [
            {
              name: 'first-site',
              business: {
                name: 'first business',
                offices: [
                  { name: 'first office' }
                ]
              }
            },
            {
              name: 'second-site',
              business: {
                name: 'second business',
                offices: []
              }
            }
          ]
        end
        it 'includes only the fields includes in the params' do
          expect(subject).to eq(expected)
        end
      end
    end
  end
end
