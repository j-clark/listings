Listings::Application.routes.draw do
  resources :listings, only: [:index, :show, :edit, :update]
end
