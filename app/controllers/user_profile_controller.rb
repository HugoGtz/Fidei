class UserProfileController < ApplicationController
    before_action :user, only: [:index,:ajustes,:validacion,:ayuda,:gFicha,:ficha,:updatePayment,:update]

    

    def index
        @p1 = Payment.where(:user_id => current_user.id, :tipo_paquete => 1, :status => true )
        @fcount1 = Array.new
        @p1.each do |p|
            positions1 = Array.new
            user = Arbol1.find_by(:user_id => p.user_id, :payment_id => p.id)
            start =  user.posicion
            @count1 = 0;
            # Primer nivel debajo del inspeccionado
            positions1.push(left1 = start*2) # nivel 1 izquierdo
            positions1.push(right1 = left1+1) # niver 1 derecho
            
            # Segundo nivel debajo del inspeccionado
            positions1.push(left2_1 = left1*2) # nivel 2 primer izquierdo
            positions1.push(left2_2 = right1*2) # nivel 2 segundo izquierdo
            positions1.push(right2_1 = left2_1+1) # nivel 2 primer derecho
            positions1.push(right2_2 = left2_2+1) # nivel 2 segundo derecho
            
            # Tercer nivel debajo del inspeccionado
            positions1.push(left3_1 = left2_1*2) # nivel 3 primer izquierdo
            positions1.push(left3_2 = right2_1*2) # nivel 3 segundo inzquierdo
            positions1.push(left3_3 = left2_2*2) # nivel 3 tercer inzquierdo
            positions1.push(left3_4 = right2_2*2) # nivel 3 cuarto inzquierdo
            
            positions1.push(right3_1 = left3_1+1) # nivel 3 primer derecho
            positions1.push(right3_2 = left3_2+1) # nivel 3 segundo derecho
            positions1.push(right3_3 = left3_3+1) # nivel 3 tercer derecho
            positions1.push(right3_4 = left3_4+1) # nivel 3 cuarto derecho
            
            positions1.each do |c|
                posExist = Arbol1.find_by(:posicion => c)
                if posExist
                    @count1+=1 
                end
            end
            @fcount1.push(@count1)
        end
        
        @p2 = Payment.where(:user_id => current_user.id, :tipo_paquete => 2, :status => true )
        @fcount2 = Array.new
        @p2.each do |p|
            positions2 = Array.new
            user = Arbol2.find_by(:payment_id => p.id, :user_id => p.user_id)
            start =  user.posicion
            @count2 = 0;
            # Primer nivel debajo del inspeccionado
            positions2.push(left1 = start*2) # nivel 1 izquierdo
            positions2.push(right1 = left1+1) # niver 1 derecho
            
            # Segundo nivel debajo del inspeccionado
            positions2.push(left2_1 = left1*2) # nivel 2 primer izquierdo
            positions2.push(left2_2 = right1*2) # nivel 2 segundo izquierdo
            positions2.push(right2_1 = left2_1+1) # nivel 2 primer derecho
            positions2.push(right2_2 = left2_2+1) # nivel 2 segundo derecho
            
            # Tercer nivel debajo del inspeccionado
            positions2.push(left3_1 = left2_1*2) # nivel 3 primer izquierdo
            positions2.push(left3_2 = right2_1*2) # nivel 3 segundo inzquierdo
            positions2.push(left3_3 = left2_2*2) # nivel 3 tercer inzquierdo
            positions2.push(left3_4 = right2_2*2) # nivel 3 cuarto inzquierdo
            
            positions2.push(right3_1 = left3_1+1) # nivel 3 primer derecho
            positions2.push(right3_2 = left3_2+1) # nivel 3 segundo derecho
            positions2.push(right3_3 = left3_3+1) # nivel 3 tercer derecho
            positions2.push(right3_4 = left3_4+1) # nivel 3 cuarto derecho
            
            positions2.each do |c|
                posExist = Arbol2.find_by(:posicion => c)
                if posExist
                    @count2+=1 
                end
            end
            @fcount2.push(@count2)
        end
        
        @p3 = Payment.where(:user_id => current_user.id, :tipo_paquete => 3, :status => true )
        @fcount3 = Array.new
        @p3.each do |p|
            positions3 = Array.new
            user = Arbol3.find_by(:payment_id => p.id, :user_id => p.user_id)
            start =  user.posicion
            @count3 = 0;
            # Primer nivel debajo del inspeccionado
            positions3.push(left1 = start*2) # nivel 1 izquierdo
            positions3.push(right1 = left1+1) # niver 1 derecho
            
            # Segundo nivel debajo del inspeccionado
            positions3.push(left2_1 = left1*2) # nivel 2 primer izquierdo
            positions3.push(left2_2 = right1*2) # nivel 2 segundo izquierdo
            positions3.push(right2_1 = left2_1+1) # nivel 2 primer derecho
            positions3.push(right2_2 = left2_2+1) # nivel 2 segundo derecho
            
            # Tercer nivel debajo del inspeccionado
            positions3.push(left3_1 = left2_1*2) # nivel 3 primer izquierdo
            positions3.push(left3_2 = right2_1*2) # nivel 3 segundo inzquierdo
            positions3.push(left3_3 = left2_2*2) # nivel 3 tercer inzquierdo
            positions3.push(left3_4 = right2_2*2) # nivel 3 cuarto inzquierdo
            
            positions3.push(right3_1 = left3_1+1) # nivel 3 primer derecho
            positions3.push(right3_2 = left3_2+1) # nivel 3 segundo derecho
            positions3.push(right3_3 = left3_3+1) # nivel 3 tercer derecho
            positions3.push(right3_4 = left3_4+1) # nivel 3 cuarto derecho
            
            positions3.each do |c|
                posExist = Arbol3.find_by(:posicion => c)
                if posExist
                    @count3+=1 
                end
            end
            @fcount3.push(@count3)
        end
        
        @p4 = Payment.where(:user_id => current_user.id, :tipo_paquete => 4, :status => true )
        @fcount4 = Array.new
        @p4.each do |p|
            positions4 = Array.new
            user = Arbol4.find_by(:payment_id => p.id, :user_id => p.user_id)
            start =  user.posicion
            @count4 = 0;
            # Primer nivel debajo del inspeccionado
            positions4.push(left1 = start*2) # nivel 1 izquierdo
            positions4.push(right1 = left1+1) # niver 1 derecho
            
            # Segundo nivel debajo del inspeccionado
            positions4.push(left2_1 = left1*2) # nivel 2 primer izquierdo
            positions4.push(left2_2 = right1*2) # nivel 2 segundo izquierdo
            positions4.push(right2_1 = left2_1+1) # nivel 2 primer derecho
            positions4.push(right2_2 = left2_2+1) # nivel 2 segundo derecho
            
            # Tercer nivel debajo del inspeccionado
            positions4.push(left3_1 = left2_1*2) # nivel 3 primer izquierdo
            positions4.push(left3_2 = right2_1*2) # nivel 3 segundo inzquierdo
            positions4.push(left3_3 = left2_2*2) # nivel 3 tercer inzquierdo
            positions4.push(left3_4 = right2_2*2) # nivel 3 cuarto inzquierdo
            
            positions4.push(right3_1 = left3_1+1) # nivel 3 primer derecho
            positions4.push(right3_2 = left3_2+1) # nivel 3 segundo derecho
            positions4.push(right3_3 = left3_3+1) # nivel 3 tercer derecho
            positions4.push(right3_4 = left3_4+1) # nivel 3 cuarto derecho
            
            positions4.each do |c|
                posExist = Arbol4.find_by(:posicion => c)
                if posExist
                    @count4+=1 
                end
            end
            @fcount4.push(@count4)
        end
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
        if ((user_signed_in?)&&(current_user.user_role == true))
            @id = current_user.id
        else
            
            redirect_to root_path, :flash => { :Error => "Aun no incias sesión!" }
        end
    end


end 
