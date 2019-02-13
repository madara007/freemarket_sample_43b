class UsersController < ApplicationController
 layout  "session", except: [:index, :show, :edit, :logout]
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def logout
  end

  def create
   @user = Snscredential.from_omniauth(request.env["omniauth.auth"])
   result = @user.save(context: :facebook_login)
     if result
       log_in @user
       redirect_to @user
     else
       redirect_to auth_failure_path
     end
   end
end
