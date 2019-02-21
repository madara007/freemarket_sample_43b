class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new
  layout  "session", only: [:new, :create]
  before_action :trading_status, except: [:new, :edit, :show, :logout, :create]
  def index
    @purchase = Item.item_buyer_list(trading_status[:progress], current_user.id)
    @purchased = Item.item_buyer_list(trading_status[:complete], current_user.id)
  end

  def new
  end

  def edit
  end

  def show
  end

  def selling
    @items = Item.item_saler_list(trading_status[:selling], current_user.id)
  end

  def progress
    @items = Item.item_saler_list(trading_status[:progress], current_user.id)
  end

  def complete
    @items = Item.item_saler_list(trading_status[:complete], current_user.id)
  end

  def purchase
    @purchase = Item.item_buyer_list(trading_status[:progress], current_user.id)
    @purchased = Item.item_buyer_list(trading_status[:complete], current_user.id)
    @select_page = params[:format]
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

  private
  def trading_status
    trading_status = {stopping: 0, selling: 1, progress: 2, complete: 3}
  end
end
