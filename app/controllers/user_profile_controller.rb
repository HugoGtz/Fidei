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
        if current_user
            
        @payments = Payment.where(:user_id => current_user.id)
        end
    end
    
    def ayuda
        render 'ayuda'
    end
    
    def ficha 
        render  'ficha'
    end
    
    def gFicha
       
        
        @payment_params = params[paymet_params_creation]
         @planes = Payment.where(user_id: current_user.id, tipo_paquete: "1")
        if (@planes.count <4)

        
       @payment = Payment.create(user_id: current_user.id, tipo_paquete: "1", costo: "3000", status: "f" )
       if @payment.save
           
           redirect_to user_profile_validacion_path	    
       end
         else
             redirect_to user_profile_index_path
         end
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
        
        def paymet_params_creation
            params.require(:data).permit(:tipo_paquete,:costo).merge(user_id: current_user, status: "f")
        end
        
        
        
end