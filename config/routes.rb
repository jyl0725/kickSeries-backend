Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects
  resources :project_users
  resources :users
  get '/profile', to: 'users#profile'
  post '/login', to: 'auths#create'


end
