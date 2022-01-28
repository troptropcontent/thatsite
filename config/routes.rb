# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :sites, only: [:show] do
    get '/:name', to: 'page#show'
  end
end
