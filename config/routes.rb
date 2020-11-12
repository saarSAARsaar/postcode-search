Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  resources :postcode_search, only: [:create]
  resources :places do
    resources :restaurants
  end
  
  root to: 'places#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
