Rails.application.routes.draw do

  root "home#index"

  resources :users, only: [:new, :create, :show] do
    resources :saved_articles, only: [:new, :create, :index, :destroy, :update]
  end

  get '/popular', to: 'search#popular'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
