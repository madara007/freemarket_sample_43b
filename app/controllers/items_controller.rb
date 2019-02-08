class ItemsController < ApplicationController
  layout  "session", except: [:index, :show]
  # トップページ作成でindex利用
  def index
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
  end

  def update
  end


  def item_params
    params.require(:item).permit(:name, :price,:description, :category_id,:buyer_id, :saler_id, :shipping_date_id,:condition_id,:region_id, :delivery_fee_id, :ship_method_id, :brand_id,:size_id, :transaction)
  end
end
