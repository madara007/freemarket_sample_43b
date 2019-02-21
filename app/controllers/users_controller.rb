class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new
  layout  "session", except: [:index, :show, :edit, :logout, :selling, :progress, :complete, :purchase, :purchased]

  def index
    @purchase = Item.where(trading: 2, buyer_id: current_user.id).order(id: "DESC")
    @purchased = Item.where(trading: 3, buyer_id: current_user.id).order(id: "DESC")
  end

  def new
  end

  def edit
  end

  def show
  end

  def selling
    @items = Item.where(trading: 1, saler_id: current_user.id).order(id: "DESC")
  end

  def progress
    @items = Item.where(trading: 2, saler_id: current_user.id).order(id: "DESC")
  end

  def complete
    @items = Item.where(trading: 3, saler_id: current_user.id).order(id: "DESC")
  end

  def purchase
    @purchase = Item.where(trading: 2, buyer_id: current_user.id).order(id: "DESC")
    @purchased = Item.where(trading: 3, buyer_id: current_user.id).order(id: "DESC")
    @page = params[:format].to_i
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
