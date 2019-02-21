class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new
  layout  "session", except: [:index, :show, :edit, :logout, :selling, :progress, :complete, :purchase, :purchased]

  def index
    @purchase = Item.item_buyer_list(2, current_user.id)
    @purchased = Item.item_buyer_list(3, current_user.id)
  end

  def new
  end

  def edit
  end

  def show
  end

  def selling
    @items = Item.item_saler_list(1, current_user.id)
  end

  def progress
    @items = Item.item_saler_list(2, current_user.id)
  end

  def complete
    @items = Item.item_saler_list(3, current_user.id)
  end

  def purchase
    @purchase = Item.item_buyer_list(2, current_user.id)
    @purchased = Item.item_buyer_list(3, current_user.id)
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
