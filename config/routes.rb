Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  namespace :api do
    
    namespace :v1 do
      resources :airlines, param: :slug
      resources :reviews, only: [:create, :destroy]
    end

  end


  #Route requests that arent for existing paths, back to our index path.
  #Once we start using react router, this will allow us to handle routing to our react component without interfering our rails routes for our API
  get '*path', to 'pages#index', via: :all
end
