Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/privacidad'
  get 'welcome/terminos'
  devise_for :users
  resources :user_profile
  resources :user_settings
end
