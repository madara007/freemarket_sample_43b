class LikesController < ApplicationController
  before_action :set_item , only: [:create, :destroy]
  layout false, only: [:create, :destroy]

  def create
    if current_user
      @like = current_user.likes.create(item_id: params[:item_id])
      respond_to do |format|
        format.html
        format.js
      end
    else
      @like = sns_user.snslikes.create(item_id: params[:item_id])
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    if current_user
      like = current_user.likes.find_by(item_id: params[:item_id])
      like.destroy
      respond_to do |format|
        format.html
        format.js
      end
    else
      like = sns_user.snslikes.find_by(item_id: params[:item_id])
      like.destroy
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

	private

	def set_item
      @item = Item.find(params[:item_id])
	end
end
