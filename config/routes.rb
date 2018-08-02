Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :topics do
    resources :posts do
      resources :comments
      resources :tags
    end
    end
  root to: 'topics#index'
  get '/posts' => 'posts#posts'
  post 'posts/rating' => 'posts#rate'
   end
  #resources :posts
  #resources :topics
  #resources :comments
  #get 'topics/:id/posts' => 'posts#topic'

