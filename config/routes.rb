Whetstone::Application.routes.draw do
  root :to => "home#index"
  devise_for :users
  resources :stones
  post "/stones/search" => "stones#search", as: "stones_search"
end
