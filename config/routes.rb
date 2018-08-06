Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :topics do
    resources :posts
    end
    resources :posts do
      resources :comments
      resources :tags
    end

  root to: 'topics#index'
  post 'posts/rating' => 'posts#rate'
  end