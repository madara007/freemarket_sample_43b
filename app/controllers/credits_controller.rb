class CreditsController < ApplicationController
  layout "logo-layout", only: :show
  before_action :set_item, only: [:show]
  before_action :authenticate_user!

  def new
  end

  def show
  end

  def create
    item = Item.find(params[:item])
    price = item.price

    if current_user
      user_id = current_user.id
      buyer_id = item.update( buyer_id: user_id)
    else
      sns_id =  sns_user.id
      buyer_id = item.update( buyer_id: sns_id)
    end
    item.update(trading: 2)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      amount:price,
      card: params['payjp-token'],
      currency: 'jpy',
    )
    redirect_to  root_path
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
