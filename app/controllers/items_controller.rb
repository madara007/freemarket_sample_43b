class ItemsController < ApplicationController

  layout  "session", except: [:index, :show]

  def index
    pickup_categories(1, 2, 3, 4)
    pickup_brands(1, 2, 3, 4)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def show
    @item = Item.find(params[:id])
    @score = Score.all
    @categorys = []
    item_category = @item.category
    while item_category
      @categorys.unshift(item_category)
      item_category = Category.find_by(name: item_category.parent_id)
    end
  end

  def update
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

  def item_params
    params.require(:item).permit(:name, :price,:description, :category_id,:buyer_id, :saler_id, :shipping_date_id,:condition_id,:region_id, :delivery_fee_id, :ship_method_id, :brand_id,:size_id, :transaction)
  end

end
