Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/new'
  get 'orders/create'
  get 'orders/show'
  get 'orders/edit'
  get 'orders/update'
  get 'orders/destroy'
  get 'customers/index'
  get 'customers/new'
  get 'customers/create'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/destroy'
  get 'myproducts/index'
  get 'myproducts/new'
  get 'myproducts/create'
  get 'myproducts/show'
  get 'myproducts/edit'
  get 'myproducts/update'
  get 'myproducts/destroy'
  get 'employees/index'
  get 'employees/new'
  get 'employees/create'
  get 'employees/show'
  get 'employees/edit'
  get 'employees/update'
  get 'employees/destroy'
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
  # root 'faculties#index'

  #for Students
  resources :students

  #for Employees
  # root "employees#index"
  post '/increaseOrder', to: "employees#increaseOrder"
  post '/decreaseOrder', to: "employees#decreaseOrder"
  get 'employees/task'
  resources :employees


  root "myproducts#index"
  get 'myproducts/defaultScope'
  get 'orders/root'
  resources :myproducts
  resources :customers
  resources :orders
end
