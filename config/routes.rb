Rails.application.routes.draw do
  devise_for :users

  #仮のルーティング
  root 'items#index'
  get 'users/show', to: 'users#show'
  get 'user/edit', to: 'users#edit'
  get 'identification', to: 'users#identification'
  get 'logout', to: 'users#logout'
  get 'card', to: 'users#card'
  get 'tests', to: 'tests#signup'
  get 'tests/confirmation', to: 'tests#confirmation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
