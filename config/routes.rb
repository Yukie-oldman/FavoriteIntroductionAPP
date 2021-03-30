Rails.application.routes.draw do

  # root 'static_pages#top'
  root 'static_pages#search'
  post '/result', to: 'static_pages#result'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :accounts
    member do
      get 'top'
    end
  end
end
