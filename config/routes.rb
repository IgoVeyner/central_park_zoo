Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'welcome#home'
  
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'create_user'
  
  get '/login', to: 'session#new', as: 'login'
  post '/login', to: 'session#create'
  post '/logout', to: 'session#destroy', as: 'logout'
  
  match '/auth/:github/callback', to: 'session#github_login', via: [:get, :post]
  
  get '/guest/:id', to: 'users#show', as: 'user'
  get '/guests', to: 'users#index', as: 'users'
  
  get '/species/:id/donate/new', to: 'donations#new', as: 'new_donation'

  resources :exhibits, only: [:index, :show] do 
    resources :species, only: [:index]
    resources :animals, only: [:index, :show]
  end

  resources :species, only: [:index, :show]

end
