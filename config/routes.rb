Rails.application.routes.draw do

  get 'tags/index'

  get 'tags/new'

  get 'tags/create'

  get 'tags/show'

  get 'tags/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :topics,shallow:true do
    resources :posts,shallow: true do
      resources :comments
      resources :tags
    end
    end
  root to: 'topics#index'
  get '/posts' => 'posts#posts'
   end
  #resources :posts
  #resources :topics
  #resources :comments
  #get 'topics/:id/posts' => 'posts#topic'

