class LikesController < ApplicationController
       before_action :set_variables
	def like
     like = current_user.likes.new(story_id: @item.id)
     like.save
	end


	private

	def set_variables
    @item = Item.find(params[:item_id])
   end

end
