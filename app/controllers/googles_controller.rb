class GooglesController < ApplicationController
  
  def new
  end

  def create
    user = Snscredential.from_omniauth(request.env["omniauth.auth"])
    if user.save
      session[:snscredential_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
   session.clear
   redirect_to root_path
  end
  
end

