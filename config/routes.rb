Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :authors
  end
end
