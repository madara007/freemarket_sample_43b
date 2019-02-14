class CreditsController < ApplicationController
  layout  "session", only: [:index]

  def index
    
  end
  

  def new

  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    item = Item.find(params[:item])
    price = item.price
    user_id = current_user.id
    buyer_id = item.update( buyer_id: user_id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      amount:price,
      card: params['payjp-token'],
      currency: 'jpy',
    )
    redirect_to  root_path
  end
end
