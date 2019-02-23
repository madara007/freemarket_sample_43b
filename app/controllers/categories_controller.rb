class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: :search
  layout false, except: [:index, :show]
  def index
    @categories = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    if @category.root?
      @select_items = Item.where(category: get_categories_descendants).includes(:likes).order("updated_at DESC")
    elsif @category.leaf?
      @select_items = Item.where(category: @category).includes(:likes).order("updated_at DESC")
    else
      @select_items = Item.where(category: get_categories_children).includes(:likes).order("updated_at DESC")
    end
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
