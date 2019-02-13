class CategorysController < ApplicationController
  layout false

  def show
    @categories = Category.where(parent_id: params[:id])
    respond_to do |format|
      format.json
    end
  end
end
