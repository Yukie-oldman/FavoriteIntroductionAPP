Rails.application.routes.draw do

  root 'static_pages#top'
  get '/search', to: 'static_pages#search'
  get '/introductions', to: 'static_pages#introductions'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :introductions
    member do
      get 'edit_profile'
    end
  end
  resources :introductions do
    member do
      get 'like'
      get 'unlike'
    end
  end
end
