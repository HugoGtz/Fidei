class AdminPanelController < ApplicationController
    def index
        render 'principal'
    end
    
    def validacion
        @payments = Payment.where.not(:avatar_file_name => nil)
        
    end     
    
    def reportes
        render 'reportes'
    end
    
    def ayuda
        render 'ayuda'
    end
    
    def validar
        id = params[:payment_id]
        tipo = params[:tipo_paquete]
        payment = Payment.find(id)
            if payment.update(status: true)
                 if posicionar(id,tipo)
                     render plain: "Ok"
                 else
                     
                     render  inline: tipo
                     
                 end
                 
            else
                    
            end
       
    end
    
    
    
    private
    
    def rol
        if current_user.supervisor_role == true
            
        else
            redirect_to root_path
        end
    end
    
    def posicionar(id,tipo)
        
        case tipo
        when "1"
            posicion = Arbol1.create(user_id: current_user.id)
            if posicion.save
                return true
            end
        
        
        when "2"
            posicion = Arbol2.create(user_id: current_user.id)
            if posicion.save
                return true
            end
        
        
         when "3"
            posicion = Arbol3.create(user_id: current_user.id)
            if posicion.save
                return true
            end
        
        
         when "4"
            posicion = Arbol4.create(user_id: current_user.id)
            if posicion.save
                return true
            end
        else
            return false
        end
    end

    
end
