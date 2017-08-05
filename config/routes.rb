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
  get 'user_profile/rFicha'
  get 'user_profile/promotores'
  
  # routes admin_panel
  get 'admin_panel/index', path: 'admin_panel'
  get 'admin_panel/validacion'
  get 'admin_panel/reportes'
  get 'admin_panel/ayuda'
  get 'admin_panel/validar'
  get 'admin_panel/rechazar'
  get 'admin_panel/email'
  get 'admin_panel/showData'
  get 'admin_panel/usuarios'
  get 'admin_panel/promotores'
  
  
  resources :user_profile
  resources :user_settings
end
