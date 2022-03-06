# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageController do
  describe 'GET show' do
    let(:thatsite) { FactoryBot.create(:site, name: 'thatsite') }
    let!(:thatsite_first_page) { FactoryBot.create(:home, site: thatsite) }
    let(:a_second_site) { FactoryBot.create(:site, name: 'second-site') }
    let!(:a_second_site_first_page) { FactoryBot.create(:home, site: a_second_site) }
    before do
      @request.host = "#{mock_subdomain}example.com"
    end
    let(:mock_subdomain) { nil }

    context 'when the page of the site requested exists' do
      context 'when the request have no subdomain' do
        it 'assigns @page with the first page of thatsite site' do
          get :show, params: { name: 'home' }
          expect(assigns(:page)).to eq(thatsite_first_page)
        end
      end

      context 'when the request have a www subdomain' do
        let(:mock_subdomain) { 'www.' }
        it 'assigns @page with the first page of thatsite site' do
          get :show, params: { name: 'home' }
          expect(assigns(:page)).to eq(thatsite_first_page)
        end
      end

      context 'when the request have a thatsite subdomain' do
        let(:mock_subdomain) { 'thatsite.' }
        it 'assigns @page with the first page of thatsite site' do
          get :show, params: { name: 'home' }
          expect(assigns(:page)).to eq(thatsite_first_page)
        end
      end

      context 'when the request have a subdomain that matches a site name' do
        let(:mock_subdomain) { 'second-site.' }
        it 'assigns @page with the first page of second-site site' do
          get :show, params: { name: 'home' }
          expect(assigns(:page)).to eq(a_second_site_first_page)
        end
      end
    end
  end
end
