class ScoresController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    item = Item.find(score_params[:item_id])
    Score.create(type: score_params[:type], user_id: item.saler_id)
    item.update(trading: 3)
    redirect_to :root
  end

  private
  def score_params
    params.permit(:type, :item_id)
  end
end
