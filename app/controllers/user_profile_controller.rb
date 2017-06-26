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
        render 'validacion'
    end
    
    def ayuda
        render 'ayuda'
    end
    
    def ficha 
        respond_to do |format|
        format.html
        format.pdf do
          render :pdf => "ficha",:template => "user_profile/ficha.html.erb",viewport_size: '1280x1024'
        end 
      end
    end
end