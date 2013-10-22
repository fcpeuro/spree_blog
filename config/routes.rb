Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :posts
    resources :categories
    resources :tags
    resources :authors
  end
end
