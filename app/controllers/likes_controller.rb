class LikesController < ApplicationController
	before_action :set_item , only: [:create, :destroy]

	def create
      @like = current_user.likes.create(item_id: params[:item_id])
      @like.save
      redirect_to  item_path(@item)
   end
	def destroy
    like = current_user.likes.find_by(item_id: params[:item_id])
    like.destroy
    redirect_to  item_path(@item)

	end


	private

	def set_item
      @item = Item.find(params[:item_id])
      @id_name = "#like-link-#{@item.id}"
	end
end
