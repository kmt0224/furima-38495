Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :item_orders, only: [:index, :create]
  end
  resource :two_factor_auth, only: [:new, :create, :destroy, :show]
end
