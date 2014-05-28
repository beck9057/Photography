class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    photographer = Photographer.authenticate(params[:session][:email], params[:session][:password])
    
    if photographer.nil?
      render 'new'
    else
      #handle successful sign in
    end
  end
  
end