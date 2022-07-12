# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSite, type: :actor do
  describe '.call' do
    let!(:user) { FactoryBot.create :user }
    context 'success' do
      context 'when the site name is available' do
        it 'creates a new site' do
          actor = described_class.call name: 'test', user: user
          expect(actor.site.name).to eq('test')
          expect(user.sites).to include(actor.site)
        end
      end
    end
    context 'fail' do
      let!(:site) { FactoryBot.create :site, users: [user], name: 'test' }
      context 'when the site name is not available' do
        it 'raises an error' do
          expect { described_class.call name: 'test', user: user }.to raise_error(ServiceActor::Failure)
        end
      end
    end
  end
end
