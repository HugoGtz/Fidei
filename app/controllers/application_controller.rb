class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
    # Overwriting the sign_in, redirect path to user form for firebase
    def after_sign_in_path_for(resource_or_scope)
      if(current_user.firebase_form === false)
        user_form_firebase_user_form_path
      else
        root_path
      end
    end

end
