class UserProfileController < ApplicationController
    before_action :user, only: [:index,:ajustes,:validacion,:ayuda]
    
    def user
        if current_user
         @id = current_user.id
        end
    end
    
    def index
        render 'principal'
    end
    
    def ajustes
        render 'ajustes'
    end
    
    def validacion
        @payments = Payment.where(:user_id => current_user.id)
    end
    
    def ayuda
        render 'ayuda'
    end
    
    def ficha 
        render  'ficha'
    end
    
    def updatePayment
        
    end
    def update
        @id = params[:payment][:id]
        @payment = Payment.find(@id)
        respond_to do |format|
            if @payment.update(payment_params)
                format.html { redirect_to user_profile_validacion_path, notice: 'Recibo enviado satisfactoriamente.' }
            else
               
            end
        end
    end
    
    private
        def payment_params
            params.require(:payment).permit(:avatar)
        end
        
end