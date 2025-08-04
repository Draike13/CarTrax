Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    resources :cars, only: [ :index, :show, :create, :update, :destroy ] do
      get "service_records", to: "cars#service_records"
      get "vin/:vin", to: "cars#search_by_vin"
      get "filter", to: "cars#filter"
    end

    resources :users, only: [ :show, :update ] do
      get "users", to: "users#index"
    end
    resources :worker_requests, only: [ :index, :create, :update, :destroy ]
    resources :customers, only: [ :index, :show ]
    post "auth/login", to: "auth#login"
  end
end
