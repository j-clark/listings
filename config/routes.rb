Listings::Application.routes.draw do
  resources :listings, only: [:index]
end
