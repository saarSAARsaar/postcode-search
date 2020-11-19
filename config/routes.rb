Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    sessions: 'users/sessions',
                                    registrations: 'users/registrations' }
  
  resources :postcode_search, only: [:create]
  resources :places do
    resources :restaurants
  end
  
  root to: 'places#index'
  # devise_scope :user do
  get 'users/sign_up', to: 'users/registrations#new'
  get 'users/sign_in', to: 'users/sessions#new'
  #   get 'users/auth/github/callback', to: 'users/sessions#create'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
