class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  layout  "session", except: [:index, :show]

  def index
    pickup_categories(1, 138, 259, 683)
    pickup_brands(2440, 3802, 4790, 6142)
  end

  def new
    @item = Item.new
    @item.item_photos.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.includes(:user)
    @score = Score.all
    @categorys = []
    item_category = @item.category
    while item_category
      @categorys.unshift(item_category)
      item_category = Category.find_by(name: item_category.parent_id)
    end
    @other_user_items = Item.where(saler_id: @item.saler_id).order("id DESC").limit(6)
    @other_category_items = Item.where(category: @item.category).order("id DESC").limit(6)
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
