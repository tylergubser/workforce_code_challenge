Rails.application.routes.draw do
  
  resources :organisations
  resources :shifts do
    match "destroy_user_shifts" => "shifts#destroy_user_shifts", :as => :destroy_user_shifts, via: :get
  end
  resources :shifts
  resources :users do 
    match "join_organisation" => "users#join_organisation", :as => :join_organisation, via: :get
  end
  resources :users do 
    match "leave_organisation" => "users#leave_organisation", :as => :leave_organisation, via: :get
  end
  
  resources :users, only: [:index, :create, :update, :destroy, :joinOrganisation]
  
  get '/', to: 'sessions#new', as: 'root'
  
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new', as:'signup'
  post '/signup', to: 'users#create'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  
  
end
