Whetstone::Application.routes.draw do
  root :to => "home#index"
  devise_for :users

  resources :comments, :discussions, :resources_stones do
    resources :votes
  end

  resources :stones_users

  resources :stones do
    resources :stones_users
    
    collection do
      post 'search'
    end
    
    post 'update_queue' => 'stones_users#update_queue'
  end

  resources :resources

  resources :users, only: [:show]

  resources :discussions do
    resources :comments
  end

  resources :stones do
    resources :resources
    resources :discussions
  end

  resources :saved_resources

  resources :resources_stones do
    resources :saved_resources
  end


  get "/stones/:id/overview" => "stones#overview", as: "stone_overview"

  get "/resources/:stone_id/filter/:filter" => "resources#filter", as: "filter_resources"

  get "/messages" => "messages#index", as: 'messages'
  get "/messages/:id" => "messages#show", as: "message"
  post "/messages" => "messages#create", as: "new_message"
  post '/users_search' => "users#search"

  mount Split::Dashboard, :at => 'split'

end

