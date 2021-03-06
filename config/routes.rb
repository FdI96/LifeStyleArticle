Rails.application.routes.draw do
  resources :categories
  resources :articles do
    resources :votes, only: [:create, :destroy]
  end
  root 'categories#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
