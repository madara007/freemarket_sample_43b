class CommentsController < ApplicationController
    def create
      @comment = Comment.create(comment: comment_params[:comment], item_id: comment_params[:item_id], user_id: current_user.id)
      redirect_to item_path(@comment.item.id)
    end

    private
    def comment_params
      params.permit(:comment, :item_id)
    end
end
