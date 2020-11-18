Rails.application.routes.draw do
  get 'orders/index'
  root to: "items#index"
  devise_for :users
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :create]
  end
end
