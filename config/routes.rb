Rails.application.routes.draw do
  resources :organisations
  resources :shifts
  resources :users
  get '/', to: 'sessions#index', as: 'root'
  get '/login', to: 'sessions#new', as: 'login'
  post '/', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new', as:'signup'
  post '/signup', to: 'users#create'
end
