class UserProfileController < ApplicationController
    before_action :user, only: [:index,:ajustes,:validacion,:ayuda]
    
    def user
         @id = current_user.id
    end
    
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