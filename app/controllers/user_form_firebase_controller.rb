class UserFormFirebaseController < ApplicationController
  def user_form
    @id = current_user.id
    @email = current_user.email
  end
end
