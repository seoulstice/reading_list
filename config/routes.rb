Rails.application.routes.draw do

  root "home#index"

  resources :users, only: [:new, :create] do
    resources :saved_articles, only: [:new, :create, :destroy, :update]
  end

  get '/popular', to: 'search#popular'
  get '/top', to: 'search#top'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
