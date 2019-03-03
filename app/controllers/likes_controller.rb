class LikesController < ApplicationController
  before_action :set_item
  layout false

  def create
    like = current_user.likes.create(item_id: params[:item_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = current_user.likes.find_by(item_id: params[:item_id])
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_item
      @item = Item.find(params[:item_id])
  end
end
