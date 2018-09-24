Rails.application.routes.draw do
  resources :line_items
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :orders
  resources :carts
  resources :stores
  resources :product_photos
  resources :products do
    member do
      put "like" => "products#like"
      put "dislike" => "products#dislike"
    end
  end
  resources :charges
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'store#index'
  put 'reduce_quantity' => 'line_items#reduce_quantity'
  mount Commontator::Engine => '/commontator'
  get 'gallery' => 'products#gallery'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
