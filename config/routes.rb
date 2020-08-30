Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :users, only: [:new, :create, :show]
  
  resources :blogs  do
    collection do
      post :confirm
    end
  end

  #routes to errors
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  
  root to: "sessions#new"
end
