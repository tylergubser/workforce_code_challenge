Rails.application.routes.draw do
  resources :organisations
  resources :shifts
  resources :users
  root "sessions#home"
  # get '/', to: 'sessions#index', as: 'root'
  # get '/login', to: 'sessions#new', as: 'login'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new', as:'signup'
  post '/signup', to: 'users#create'
end
