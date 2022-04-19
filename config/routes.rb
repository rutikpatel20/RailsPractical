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
  # root 'faculties#index'

  #for Students
  resources :students

  #for Employees
  # root "employees#index"
  post "/increaseOrder", to: "employees#increaseOrder"
  post "/decreaseOrder", to: "employees#decreaseOrder"
  get "employees/task"
  resources :employees

  # root "myproducts#index"
  get "myproducts/defaultScope"
  get "orders/root"
  resources :myproducts
  resources :customers
  resources :orders

  # Active Record Association
  # root "events#index"
  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create", as: "log_in"
  delete "logout", to: "sessions#destroy"

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
  get "/:event_id/comments/new", to: "comments#new", :as => :new_comment
  post "/:event_id/comments/new", to: "comments#create"
  get "/events/:event_id/comments/:comment_id/edit", to: "comments#edit", :as => :edit_comment
  post "/events/:event_id/comments/:comment_id/edit/", to: "comments#update"
  delete "/events/:event_id/comments/:comment_id/", to: "comments#destroy", :as => :destroy_comment

  resources :events do
    resources :comments do
      member do
        post :like
      end
    end
  end

  # Resourceful Routes for rproducts
  resources :rproducts do
    resources :rorders
  end

  # Namespace Routing
  namespace :business do
    get "search", to: "rcustomers#search_customer"
    resources :rcustomers, only: [:index, :new, :create, :edit, :update] do
      member do
        get "name_preview"
        delete "delete_customer"
      end
    end
  end

  root "rproducts#index"
end
