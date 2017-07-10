class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  
  def create
    user = User.new(user_params)
    if user.save
      sign_in(user)
      return render nothing: true
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
