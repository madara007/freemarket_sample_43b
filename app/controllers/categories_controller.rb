class CategoriesController < ApplicationController
  layout false, except: [:index, :show]
  def index
    @categories = Category.where(params[:id])
  end

  def  show
    @category = Category.find(params[:id])
  end

  def search
    @categories = Category.where(parent_id: params[:id])
    respond_to do |format|
      format.json
    end
  end
end
