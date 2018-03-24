Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :products

  get 'simple_pages/contact'

  post 'simple_pages/thank_you'

  get 'simple_pages/index'

  get 'simple_pages/landing_page'

  root 'simple_pages#index'

  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
