Rails.application.routes.draw do
  #get 'places/:id', to: 'places#show', as: 'places'

  resources :postcode_search, only: [:create]
  resources :places

  root 'places#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
