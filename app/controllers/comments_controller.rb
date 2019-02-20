class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to item_path(@comment.item.id)
  end

  private
  def comment_params
    params.permit(:comment, :item_id)
  end
end
