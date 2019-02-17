class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: :search
  layout false, except: [:index, :show]
  def index
    @categories = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    @children = get_categories_children
    @descendants = get_categories_descendants
  end

  def search
    @categories = Category.where(parent_id: params[:id])
    respond_to do |format|
      format.json
    end
  end

  private

  def get_categories_children
    return Category.find(params[:id]).self_and_children
  end

  def get_categories_descendants
    return Category.find(params[:id]).self_and_descendants
  end
end
