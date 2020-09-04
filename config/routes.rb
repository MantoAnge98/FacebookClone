Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :users, only: [:new, :create, :show]
  
  resources :blogs  do
    collection do
      post :confirm
    end
  end


  #routes to errors
  get '404', :to => 'errors#not_found'
  get '500', :to => 'errors#internal_error'
  
  
  #root to: "sessions#new"
  root to: "users#index"

end

