class AdminPanelController < ApplicationController
        before_action :rol, only: [:index,:validacion,:validar,:reportes,:ayuda]

    def index
        @p1 = Arbol1.all
        @p2 = Arbol2.all
        @p3 = Arbol3.all
        @p4 = Arbol4.all
        
        render 'principal'
        
    end
    
    def validacion
        @payments = Payment.where.not(:avatar_file_name => nil, :status => true)
        
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
                     redirect_to admin_panel_validacion_path
                 else
                     render  inline: tipo
                 end
                 
            else
                    
            end
       
    end
    
    
    
    private
    
    def rol
        if ((user_signed_in?)&&(current_user.supervisor_role == true))
            
        else
            @notice = true
            redirect_to root_path, :flash => { :Error => "Aun no has inciado sesión" }
        end
    end
    
    def posicionar(id,tipo)
        
        case tipo
        when "1"
            posant = Arbol1.last
            
            if posant == nil
                ant = 1
            else
                ant = posant.posicion
            ant += 1
            end
            posicion = Arbol1.create(user_id: current_user.id, posicion: ant, payment_id: id)
            if posicion.save
                return true
            end
        
    
        
        
        when "2"
            posant = Arbol2.last
            
            if posant== nil
                ant = 1
            else
                ant = posant.posicion
                ant += 1
            end
            posicion = Arbol2.create(user_id: current_user.id, posicion: ant, payment_id: id)
            if posicion.save
                return true
            end
        
        
         when "3"
             posant = Arbol3.last
            
            if posant == nil
                ant = 1
            else
                    ant = posant.posicion
                    ant += 1
                
            end
            posicion = Arbol3.create(user_id: current_user.id, posicion: ant, payment_id: id)
            if posicion.save
                return true
            end
        
        
         when "4"
             posant = Arbol4.last
            
            if posant == nil
                ant = 1
            else
                ant = posant.posicion
            ant += 1
            end
            posicion = Arbol4.create(user_id: current_user.id, posicion: ant, payment_id: id)
            if posicion.save
                return true
            end
        else
            return false
        end
    end
    
    
    

    
end
