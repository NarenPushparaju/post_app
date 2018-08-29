Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1,defaluts: {format: :json} do
      resources :users , only: :index
      resources :topics
    end
    end
  resources :topics do
    resources :posts
    end
    resources :posts do
      resources :comments
      resources :tags
    end

  get 'comments/rate/:id', to: 'comments#rate', as: :comment_rate

  post 'posts/dateFilter'

  root to: 'topics#index'


  end