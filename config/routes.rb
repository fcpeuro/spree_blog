Spree::Core::Engine.routes.draw do
  namespace :api do
    resources :posts
    resources :tags
  end

  namespace :admin do
    resources :authors
    resources :categories
    resources :posts
    resources :tags
  end
end
