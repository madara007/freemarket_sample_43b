class ItemsController < ApplicationController

  def index
    pickup_categories(1, 2, 3, 4)
    pickup_brands(1, 2, 3, 4)
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @score = Score.all
  end

  private

  def pickup_categories(women, menz, baby, cosume)
    @ladies = Item.get_items_category(women)
    @menzes = Item.get_items_category(menz)
    @babies = Item.get_items_category(baby)
    @cosumes = Item.get_items_category(cosume)
  end

  def pickup_brands(chanel, nike, puma, vuitton)
    @chanels = Item.get_items_brand(chanel)
    @nikes = Item.get_items_brand(nike)
    @pumas = Item.get_items_brand(puma)
    @vuittons = Item.get_items_brand(vuitton)
  end

end
