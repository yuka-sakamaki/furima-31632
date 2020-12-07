Rails.application.routes.draw do
  get 'orders/index'
  root to: "items#index"
  devise_for :users
  resources :items do
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  get 'item/tag/:tag_name', to: "items#tag"
end
