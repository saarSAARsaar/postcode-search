Rails.application.routes.draw do
  get 'places/:postcode', to: 'places#show', as: 'places'

  resources :postcode_search

  root 'postcode_search#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
