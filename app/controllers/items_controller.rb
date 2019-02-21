class ItemsController < ApplicationController

  layout  "session", except: [:index, :show]

  def index
    pickup_categories(1, 138, 259, 683)
    pickup_brands(2440, 3802, 4790, 6142)
  end

  def new
    @item = Item.new
    4.times {@item.item_photos.build}
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render "new"
    else
      t = 4 - @item.item_photos.length
      t.times {@item.item_photos.build}
      render "new"
    end
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
    @ladies = Item.includes(:likes).get_items_category(Category.get_categorys_lineup(women))
    @menzes = Item.includes(:likes).get_items_category(Category.get_categorys_lineup(menz))
    @babies = Item.includes(:likes).get_items_category(Category.get_categorys_lineup(baby))
    @cosumes = Item.includes(:likes).get_items_category(Category.get_categorys_lineup(cosume))
  end

  def pickup_brands(chanel, nike, puma, vuitton)
    @chanels = Item.includes(:likes).get_items_brand(chanel)
    @nikes = Item.includes(:likes).get_items_brand(nike)
    @pumas = Item.includes(:likes).get_items_brand(puma)
    @vuittons = Item.includes(:likes).get_items_brand(vuitton)
  end

  def item_params
    brand = Brand.find_by(name: params[:item][:brand_name])
    brand_id = (brand.present?) ? (brand.id) : nil
    params.require(:item).permit(:name, :price, :description, :category_id, :shipping_date_id, :condition_id, :region_id, :delivery_fee_id, :ship_method_id, :brand_id, :size_id, item_photos_attributes: [:id, :photo]).merge(saler_id: current_user.id, brand_id: brand_id)
  end
end
