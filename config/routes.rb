Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :topics do
     resources :posts do
       resources :comments
     end
   end
  #resources :posts
  #resources :topics
  #resources :comments
  #get 'topics/:id/posts' => 'posts#topic'
end
