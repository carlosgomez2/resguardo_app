Rails.application.routes.draw do

  root 'dashboard#index'
  get 'dashboard/index'

#, shallow: true

  devise_for :users
  resources :clients do
    resources :packages
  end

end
