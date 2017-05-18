class UserProfileController < ApplicationController
    def index
        render 'principal'
    end
    
    def ajustes
        render 'ajustes'
    end
    
    def validacion
        render 'validacion'
    end
    
    def ayuda
        render 'ayuda'
    end
end