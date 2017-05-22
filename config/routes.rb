Rails.application.routes.draw do

  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'

  root 'products#index'
  devise_for :users

  namespace :admin do
    root 'static_pages#about'
    get 'static_pages/about'
    resources :products
    resources :categories
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

   resources :carts do
     collection do
       delete :clean
     end
   end

   resources :cart_items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
