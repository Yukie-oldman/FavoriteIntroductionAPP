Rails.application.routes.draw do

  root 'static_pages#top'
  get '/rakuten_search', to: 'static_pages#rakuten_search'
  get '/youtube_search', to: 'static_pages#youtube_search'
  get '/introductions', to: 'static_pages#introductions'
  get '/signup', to: 'users#new'
  get '/unfollow', to: 'static_pages#unfollow'
  get '/follow', to: 'static_pages#follow'
  get '/followtag_search', to: 'static_pages#followtag_search'
  post '/add_tag', to: 'static_pages#add_tag'

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
