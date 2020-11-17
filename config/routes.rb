Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'welcome#home'
  
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'create_user'

  get '/login', to: 'session#new', as: 'login'
  post '/login', to: 'session#create'

  get '/guest/:id', to: 'users#show', as: 'user'
end
