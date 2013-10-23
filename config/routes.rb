Howfat::Application.routes.draw do
  resources :users, only: :index

  root 'pages#index'
  get '/auth/:provider/callback', to: 'sessions#callback'
end
