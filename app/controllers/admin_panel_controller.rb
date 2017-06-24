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
end
