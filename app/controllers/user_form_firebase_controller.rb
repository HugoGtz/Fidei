class UserFormFirebaseController < ApplicationController
  def user_form
    @id = current_user.id
    @email = current_user.email
  end

  def changeFormStatus
    @user = current_user
    @user.firebase_form = true
    @user.save
    if(current_user.superadmin_role === true)
      render :js => "window.location = '/'"
    else
      render :js => "window.location = '/'"
    end
  end
end
