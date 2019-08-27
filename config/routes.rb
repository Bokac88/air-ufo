Rails.application.routes.draw do
  devise_for :users
  root to: 'ufos#index'

  resources :ufos do
    collection do
      get :list_own
    end
    resources :rentals, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
