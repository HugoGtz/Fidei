class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def create
    pass = gPass.to_str
    
    user = User.new((user_params).merge(pass_firebase: pass))
    if user.save
      sign_in(user)
      return render :json=> {:success=>true, :auth_token=> pass}
    else
      set_flash_message(:alert, :invalid)
      render :json=> user.errors, :status=>422
    end
  end

  protected
       
       def token(pass)
        user = User.find_by(current_user.id)
        user.pass_firebase = pass.to_str
        user.save
       end
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
      
      def gPass
        require 'securerandom'
        random_string = SecureRandom.base64
        return random_string

      end
end
