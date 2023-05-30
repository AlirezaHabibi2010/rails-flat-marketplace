Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  # root to: "pages#home"
  resources :flats do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :list, :show, :edit, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
