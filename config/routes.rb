Rails.application.routes.draw do
  get 'books/index'
  get 'books/new'
  get 'books/create'
  get 'books/show'
  get 'books/edit'
  get 'books/update'
  get 'books/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # for Products
  resources :products
  # root 'products#index'

  # for Authors
  resources :authors
  root 'authors#index'

  #for Books
  resources :books
end
