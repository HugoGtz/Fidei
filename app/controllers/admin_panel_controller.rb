class AdminPanelController < ApplicationController
    def index
        render 'principal'
    end
    
    def validacion
        render 'validacion'
    end     
    
    def reportes
        render 'reportes'
    end
    
    def ayuda
        render 'ayuda'
    end
end
