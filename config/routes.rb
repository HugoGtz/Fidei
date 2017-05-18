Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/privacidad'
  get 'welcome/terminos'
  get 'user_form_firebase/user_form'
  devise_for :users
  
  get  'user_profile/index'
  get 'user_profile/ajustes'
  get 'user_profile/validacion'
  get 'user_profile/ayuda'
  
  resources :user_profile
  resources :user_settings
end
