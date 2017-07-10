class Users::SessionsController < Devise::SessionsController
  respond_to :json
  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in :user, resource
      pass = User.find_by_id(current_user.id)
     return render :json=> {:success=>true, :auth_token=> (pass.pass_firebase)}
    end

    invalid_login_attempt
  end

  protected

    def invalid_login_attempt
      set_flash_message(:alert, :invalid)
      render json: flash[:alert], status: 401
    end

end
