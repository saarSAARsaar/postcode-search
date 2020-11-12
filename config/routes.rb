Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }
  
  resources :postcode_search, only: [:create]
  resources :places do
    resources :restaurants
  end
  
  root to: 'places#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
