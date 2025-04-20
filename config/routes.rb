Rails.application.routes.draw do
  get "carts/show"
  get "carts/add_product"
  get "carts/remove_product"
  get "carts/checkout"
  devise_for :admins
  devise_for :users, controllers: { sessions: "users/sessions" }

  resources :products, only: [ :index, :show, :create, :update, :destroy ]
  resource :admin, only: [ :show ], controller: :admin
  resources :admins, only: [ :index ]
  resources :users, only: [ :index ]

  resources :users do
    get :orders, on: :member  # GET /users/:id/orders
  end

  resource :cart, only: [ :show ] do
    post "add_product", to: "carts#add_product"
    delete "remove_product", to: "carts#remove_product"
    post "checkout", to: "carts#checkout"
  end


  get "up" => "rails/health#show", as: :rails_health_check

  root "products#index"
end
