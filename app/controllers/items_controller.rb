class ItemsController < ApplicationController

  def index
    @ladies = Item.where(category_id: 82).order("id DESC").first(4)
    @menzes = Item.where(category_id: 83).order("id DESC").first(4)
    @babies = Item.where(category_id: 84).order("id DESC").first(4)
    @cosumes = Item.where(category_id: 85).order("id DESC").first(4)
    @chanels = Item.where(brand_id: 1).order("id DESC").first(4)
    @nikes = Item.where(brand_id: 2).order("id DESC").first(4)
    @pumas = Item.where(brand_id: 3).order("id DESC").first(4)
    @vuittons = Item.where(brand_id: 4).order("id DESC").first(4)
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @score = Score.all
  end
end
