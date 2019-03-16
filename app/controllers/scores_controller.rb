class ScoresController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @score = Score.new
  end

  def create
    @item = Item.find(score_params[:item_id])
    @score = Score.new(type: score_params[:type], user_id: @item.saler_id, item_id: score_params[:item_id])
      @item.update(trading: 3)
      binding.pry
      redirect_to :root
  end

  private
  def score_params
    params.permit(:type, :item_id)
  end
end
