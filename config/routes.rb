Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'welcome#home'
  
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'create_user'
  
  get '/login', to: 'session#new', as: 'login'
  post '/login', to: 'session#create'
  post '/logout', to: 'session#destroy', as: 'logout'
  
  get '/auth/:github/callback', to: 'session#github_login'

  get 'guests/most_donations', to: 'users#most_donations', as: 'most_donation'
  get '/zookeepers', to: 'users#zookeepers', as: 'zookeepers'

  resources :guests, only: [:index, :show, :edit, :update], controller: 'users', as: 'user' do
    get '/donations', to: 'donations#users_index', as: 'donations'
  end

  resources :exhibits do 
    resources :species, only: [:index]
    resources :animals, only: [:index, :show, :new]
  end

  resources :animals

  resources :species do
    resources :donations, only: [:new, :create, :index]
    get '/top_donor', to: 'donations#top_donor', as: 'top_donor'
  end

end
