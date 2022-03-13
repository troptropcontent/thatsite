# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  constraints subdomain: "member" do
    get "/" => "dashboard#show"
    get '/:name', to: 'dashboard#show'
    resources :sites, param: :name, only: [:new, :edit, :create, :update]
    scope '/todo' do
      put "/basic_info", to: "communication/todo/base#basic_info"
    end
  end
  root 'page#show'


  get '/:name', to: 'page#show', constraints: { subdomain: /^[a-zA-Z0-9]*/ }
end

