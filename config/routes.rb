Howfat::Application.routes.draw do
  root 'pages#index'
  get '/auth/:provider/callback', to: 'sessions#fitbit'
end
