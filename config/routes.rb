Howfat::Application.routes.draw do
  resources :users, only: :index

  root 'pages#index'

  get '/auth/:provider/callback', to: 'sessions#fitbit',  constraints: lambda {|req| req.params[:provider] == 'fitbit'  }
  get '/auth/:provider/callback', to: 'sessions#twitter', constraints: lambda {|req| req.params[:provider] == 'twitter' }
end
