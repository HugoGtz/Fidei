class UserProfileController < ApplicationController
    before_action :user, only: [:index,:ajustes,:validacion,:ayuda,:gFicha,:ficha,:updatePayment,:update]

    

    def index
        @p1 = Payment.where(:user_id => current_user.id, :tipo_paquete => "1", :status => true ).size
        
        @p2 = Payment.where(:user_id => current_user.id, :tipo_paquete => "2", :status => true ).size
        
        @p3 = Payment.where(:user_id => current_user.id, :tipo_paquete => "3", :status => true ).size
        
        @p4 = Payment.where(:user_id => current_user.id, :tipo_paquete => "4", :status => true ).size
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

    def gFicha

            tipo_paquete = params[:tipo_paquete]
            costo = params[:costo]
            @planes = Payment.where(user_id: current_user.id, tipo_paquete: tipo_paquete )
            if (@planes.size < 3)
                @payment = Payment.create(user_id: current_user.id,tipo_paquete: tipo_paquete, costo: costo, status: "f")
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

    
    
    def user
        if current_user
            @id = current_user.id
        else
            redirect_to root_path 
        end
    end


end 
