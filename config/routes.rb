# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  constraints subdomain: "member" do
    get "/" => "dashboard#show"
  end
  root 'page#show'


  get '/:name', to: 'page#show', constraints: { subdomain: /^[a-zA-Z0-9]*/ }
end

