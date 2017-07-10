class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def create
    user = User.new((user_params).merge(pass_firebase: params[:user][:password]))
    if user.save
      sign_in(user)
      return render :json=> {:success=>true, :auth_token=> pass}
    else
      set_flash_message(:alert, :invalid)
      render :json=> user.errors, :status=>422
    end
  end

  protected
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
end
