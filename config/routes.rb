Spree::Core::Engine.routes.draw do
  namespace :api do
    resources :tags
  end

  namespace :admin do
    resources :posts
    resources :categories
    resources :tags
    resources :authors
  end
end
