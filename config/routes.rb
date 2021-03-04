Rails.application.routes.draw do
  devise_for :users
  resources :vaults do
    resources :links
  end
  root 'vaults#index'
end
