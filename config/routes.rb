Whetstone::Application.routes.draw do
  root :to => "home#index"
  devise_for :users
  
  resources :votes
  
  resources :stones do
    resources :stones_users, as: :goals, only: [:new, :create]
  end

  resources :stones do
    resources :discussions
  end

  resources :discussions do
    resources :comments
  end

  resources :stones do
    resources :resources
  end
  
  post "/stones/search" => "stones#search", as: "stones_search"
  
end
