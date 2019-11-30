Rails.application.routes.draw do
  devise_for :users

  #仮のルーティング
  root 'items#index'
  resources :items do
    collection{ get "search"}
    collection do
      get 'items/get_category_children', defaults: { format: 'json' }
      get 'items/get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :signup, only: [:crate] do
    collection do
      get  'index'
      get  'registration'
      get  'phone'
      post 'phone' => 'signup#send_sms'
      get  'phone2'
      post 'phone2' => 'signup#check_sms'
      get  'address'
      get  'payment'
      post 'create'
      get  'complete'
    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      # post 'delete', to: 'card#delete'
    end
  end

  resources :users, only: [:show, :edit] do
    collection do
      get 'login', to: 'users#login'
      get 'logout', to: 'users#logout'
      get 'card', to: 'users#card'
    end
  end

  get 'item/confirmation', to: 'items#confirmation'
  get 'identification', to: 'users#identification'

  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
