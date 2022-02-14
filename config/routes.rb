# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'page#show'

  get '/:name', to: 'page#show', constraints: { subdomain: '/^[a-zA-Z]*/' }


end
