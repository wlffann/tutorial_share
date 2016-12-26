Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users

  namespace :admin do
    resources :users, only: [:new, :create, :show]
    resources :categories, only: [:new, :create, :show]
  end
end
