Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :posts
    resources :authors
  end
end
