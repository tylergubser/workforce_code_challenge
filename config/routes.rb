Rails.application.routes.draw do
  resources :organisations
  resources :shifts
  resources :users, only: [:index, :create, :update, :destroy]
  # root "sessions#home"
  # get '/', to: 'sessions#index', as: 'root'
  get '/', to: 'sessions#new', as: 'root'
  # get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # post '/logout'
  get '/signup', to: 'users#new', as:'signup'
  post '/signup', to: 'users#create'
end
