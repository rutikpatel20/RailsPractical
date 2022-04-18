Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/edit'
  get 'categories/new'
  get 'categories/update'
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


  # root "myproducts#index"
  get 'myproducts/defaultScope'
  get 'orders/root'
  resources :myproducts
  resources :customers
  resources :orders

  # Active Record Association
  root 'events#index'
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
    collection do
      get :userprofile
    end
    member do
      get :enroll_event
      post :post_user
      get :unenroll_event
    end
  end

  resources :categories

  # Event Routes
  get '/:event_id/comments/new', to: 'comments#new', :as => :new_comment
  post '/:event_id/comments/new', to: 'comments#create'
  get '/events/:event_id/comments/:comment_id/edit', to: 'comments#edit', :as => :edit_comment
  post '/events/:event_id/comments/:comment_id/edit/', to: 'comments#update'
  delete '/events/:event_id/comments/:comment_id/', to: 'comments#destroy', :as => :destroy_comment

  resources :events do
    resources :comments do
      member do
        post :like
      end
    end
  end
end
