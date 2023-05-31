Rails.application.routes.draw do
  root to: "flats#index"
  devise_for :users
  get "/bookings/requests_list", to: "bookings#requests_list"
  get "/bookings/:id/confirmation", to: "bookings#confirmation", as:"booking_confirmation"
  get "/flats/owner_requests_list", to: "flats#owner_requests_list"
  get "/flats/list", to: "flats#list"
  # root to: "pages#home"
  resources :flats do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :list, :show, :edit, :update, :destroy, :accept]

  resources :bookings do
    member do
      get  "accept"
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
