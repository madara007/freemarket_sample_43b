class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new
  before_action :selection_page, only: [:selling, :purchase]
  before_action :purchase_data, only: [:index, :purchase]
  before_action :trading_status, except: [:new, :edit, :show, :logout]
  layout "logo-layout", only: [:new]

  def index
    @select_page = "progress"
  end

  # def create
  #   @user = Snscredential.from_omniauth(request.env["omniauth.auth"])
  #   result = @user.save(context: :facebook_login)
  #   if result
  #     log_in @user
  #     redirect_to @user
  #   else
  #     redirect_to auth_failure_path
  #   end
  # end

  def new
  end

  def edit
  end

  def show
  end

  def selling
    @selling = Item.item_saler_list(trading_status[:selling], current_user.id)
    @progress = Item.item_saler_list(trading_status[:progress], current_user.id)
    @complete = Item.item_saler_list(trading_status[:complete], current_user.id)
  end

  def purchase
  end

  def logout
  end

  private
  def trading_status
    trading_status = {stopping: 0, selling: 1, progress: 2, complete: 3}
  end

  def selection_page
    @select_page = params[:format]
  end

  def purchase_data
    @purchase = Item.item_buyer_list(trading_status[:progress], current_user.id)
    @purchased = Item.item_buyer_list(trading_status[:complete], current_user.id)
  end
end
