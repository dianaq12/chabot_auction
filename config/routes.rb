ChabotAuction::Application.routes.draw do


  resources :products do
    resources :bids
  end
  namespace :admin do
    resources :categories do as_routes end
    resources :bids do as_routes end

    resources :contacts do as_routes end

    resources :products do as_routes end
  end

  authenticated :user do
    root :to => 'admin/products#index'
  end
  root :to => "products#index"
  devise_for :users
  resources :users
end