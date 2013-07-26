Whetstone::Application.routes.draw do
  root :to => "home#index"
  devise_for :users
  resources :votes
  resources :stones
  resources :resources
  post "/stones/search" => "stones#search", as: "stones_search"
end
