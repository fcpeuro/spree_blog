Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :posts
    resources :tags
    resources :authors
  end
end
