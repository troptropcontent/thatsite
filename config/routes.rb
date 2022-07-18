# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'

  devise_for :users

  root 'page#show'
  get '/:name', to: 'page#show', constraints: { subdomain: /^[a-zA-Z0-9]*/ }
end
