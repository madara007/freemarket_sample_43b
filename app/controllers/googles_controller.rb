class GooglesController < ApplicationController
  
  def new
  end

  def create
    user = Snscredential.from_omniauth(request.env["omniauth.auth"])
    if user.save
      session[:snscredential_id] = user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:Snscredential_id] = nil
    redirect_to new_session_path
  end
end

