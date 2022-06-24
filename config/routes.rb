# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users
  constraints subdomain: "member" do
    get "/" => "dashboard#show"
    get '/:name', to: 'dashboard#show'
    resources :sites, param: :name, only: [:new, :edit, :create, :update]
  end
  root 'page#show'


  get '/:name', to: 'page#show', constraints: { subdomain: /^[a-zA-Z0-9]*/ }
end

