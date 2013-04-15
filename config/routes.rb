AtlParks::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :parks

  root :to => 'home#index'
end
