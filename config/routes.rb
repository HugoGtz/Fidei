Rails.application.routes.draw do
  root 'welcome#index'
  
  # routes welcome
  get 'welcome/privacidad'
  get 'welcome/terminos'
  
  # route user_form_firebase
  get 'user_form_firebase/user_form'

  get 'user_form_firebase/changeFormStatus'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # routes user profile
  get 'user_profile/index'
  get 'user_profile/ajustes'
  get 'user_profile/validacion'
  get 'user_profile/update'
  get 'user_profile/ayuda'
  get 'user_profile/ficha'
  get 'user_profile/gFicha'
  
  # routes admin_panel
  get 'admin_panel/index', path: 'admin_panel'
  get 'admin_panel/validacion'
  get 'admin_panel/reportes'
  get 'admin_panel/ayuda'

  resources :user_profile
  resources :user_settings
end
