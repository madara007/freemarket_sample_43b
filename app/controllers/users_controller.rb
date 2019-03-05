class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new
  before_action :selection_page, only: [:selling, :purchase]
  before_action :purchase_data, only: [:index, :purchase]
  before_action :trading_status, except: [:new, :edit, :show, :logout]
  before_action :get_profile, only: [:profile, :entry]
  layout "logo-layout", only: [:new, :profile, :entry]

  def index
    @select_page = "progress"
  end

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

  def profile
  end

  def entry
    if current_user.id == @profile.user_id
      unless @profile.update(profile_params)
        render "profile"
      end
    end
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

  def get_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:postal_code, :prefecture, :city, :number, :building)
  end
end
