Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/', to: 'users#index'
  root 'users#index'
  resources :users
  resources :post

  # Defines the root path route ("/")
  # root "articles#index"
end
