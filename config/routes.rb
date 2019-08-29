Rails.application.routes.draw do
  devise_for :users
  root to: 'ufos#index'

  resources :ufos do
    collection do
      get :list_own
      get 'search', to: 'ufos#search'
    end
    resources :rentals, only: [:create]
  end

  resources :rentals, only: %i[index] do
    resources :reviews, only: %i[new create]
  end
end
