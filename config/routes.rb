# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'page#show'
  # this is for public site of thatsite, with now site param it will return the first page of this name
  get '/:name', to: 'page#show', as: :page_show

  resources :sites, only: [:show] do
    get '/:name', to: 'page#show', as: :page_show
  end
end
