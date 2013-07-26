Whetstone::Application.routes.draw do
  root :to => "home#index"
  devise_for :users
  resources :votes
  resources :stones do
    resources :stones_users, as: :goals, only: [:new, :create]
  end
  resources :resources
  post "/stones/search" => "stones#search", as: "stones_search"


end
