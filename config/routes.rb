Rails.application.routes.draw do
  devise_for :users
  resources :sites, only: [:show] do
    get '/:page_name', to: 'pages#show'
  end
end
