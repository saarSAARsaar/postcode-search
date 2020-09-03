Rails.application.routes.draw do
  resources :postcode_search, only: [:create]
  resources :places

  root 'places#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
