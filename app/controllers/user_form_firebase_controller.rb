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
      render :js => "window.location = '/admin_panel'"
    else
      render :js => "window.location = '/user_profile/index'"
    end
  end
end
