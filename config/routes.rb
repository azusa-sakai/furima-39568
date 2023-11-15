Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'articles#index'
  resources :articles
end
