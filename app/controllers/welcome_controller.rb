class WelcomeController < ApplicationController
  before_action :user, only: [:index,:terminos,:privacidad]
  def user
        @id = current_user.id
  end
  def index
    
  end
  
  def terminos
    render 'terminos'
  end
  
  def privacidad
    render 'privacidad'
  end
end
