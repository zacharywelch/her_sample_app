Rails.application.routes.draw do
  resources :users
  namespace :blog do
    resources :comments
  end
  root to: 'users#index'
end
