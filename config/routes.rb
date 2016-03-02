Rails.application.routes.draw do

  root 'dashboard#index'
  get 'dashboard/index'

#

  devise_for :users
  resources :clients, shallow: true do
    resources :packages
  end

end
