Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # for Products
  resources :products
  # root 'products#index'

  # for Authors
  resources :authors
  # root 'authors#index'

  #for Books
  resources :books

  #for Faculties
  resources :faculties
  root 'faculties#index'

  #for Students
  resources :students
end
