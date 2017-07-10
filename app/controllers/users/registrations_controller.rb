class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def create
    pass = gPass
    
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
       
       def token(pass)
        user = User.find_by(current_user.id)
        user.pass_firebase = pass.to_str
        user.save
       end
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
      
      def gPass
      g = ('a'..'z').to_a
      #=> ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
      
     pass = 10.times.map { g.sample }.join
      return pass
      end
end
