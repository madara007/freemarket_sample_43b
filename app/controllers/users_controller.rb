class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new
  layout  "session", except: [:index, :show, :edit, :logout, :selling, :progress, :complete, :purchase, :purchased]

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def selling
  end

  def progress
  end

  def complete
  end

  def purchase
  end

  def purchased
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
