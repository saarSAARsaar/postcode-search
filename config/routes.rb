Rails.application.routes.draw do
  get 'hub/index'

  resources :postcode_search

  root 'postcode_search#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
