# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController do
  include Devise::Test::ControllerHelpers
  describe 'GET show' do
    let!(:user) { FactoryBot.create(:user) }
    context 'when no user is signed in' do
      it 'redirects to the log in page' do
        get 'show'
        expect(response).to redirect_to('/users/sign_in')
      end
    end
    context 'when the user is signed in' do
      before { sign_in user }
      context 'when the user does not have any sites' do
        it 'redirects to the sites new page' do
          get 'show'
          expect(response).to redirect_to('/sites/new')
        end
      end
    end
  end
end
