Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/privacidad'
  get 'welcome/terminos'
  get 'user_form_firebase/user_form'
  get 'user_form_firebase/changeFormStatus'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :user_profile
  resources :user_settings
end
