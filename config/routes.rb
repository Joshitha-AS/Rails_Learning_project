Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :products, only: [:index, :show, :create, :update, :destroy]
  resource :admin, only: [ :show ], controller: :admin
  resources :admins, only: [ :index ]
  resources :users, only: [ :index ]
  resources :users do
    get :orders, on: :member  # GET /users/:id/orders
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "products#index"
end
