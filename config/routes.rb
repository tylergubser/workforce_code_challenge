Rails.application.routes.draw do
  resources :organisations
  resources :shifts
  resources :users do 
    match "join_organisation" => "users#join_organisation", :as => :join_organisation, via: :get
  end
  resources :users do 
    match "leave_organisation" => "users#leave_organisation", :as => :leave_organisation, via: :get
  end
  resources :users, only: [:index, :create, :update, :destroy, :joinOrganisation]
  # root "sessions#home"
  # get '/', to: 'sessions#index', as: 'root'
  get '/', to: 'sessions#new', as: 'root'
  # get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # post '/logout'
  get '/signup', to: 'users#new', as:'signup'
  post '/signup', to: 'users#create'
  # patch "/orgupdate", to: 'users#join_organisation'
  
end
