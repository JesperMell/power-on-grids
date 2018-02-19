Rails.application.routes.draw do
  get 'sessions/new'

  # get "public#index"
  scope module: :public do
    root :to => "public#index"
  end
  namespace :public do
    resources :games do
      get "add_player", to: "games#add_player", on: :collection
    end
    resources :users
  end

  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :map
    resources :zone
    resources :city
    resources :connection
  end

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
