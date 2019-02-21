class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_item, only: [:show, :destroy]
  layout  "session", except: [:index, :show]
  layout false, only: [:search]

  def index
    @lady = Category.ladies
    @menz = Category.menz
    @baby = Category.baby
    @cosume = Category.cosume
    pickup_categories(@lady, @menz, @baby, @cosume)
    @chanel = Brand.chanel
    @nike = Brand.nike
    @puma = Brand.puma
    @vuitton = Brand.vuitton
    pickup_brands(@chanel, @nike, @puma, @vuitton)
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
    @comments = @item.comments.includes(:user)
    saler = @item.saler_id
    @score = Score.where(user_id: saler)
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

  def destroy
    if @item.saler_id == (current_user.id || sns_user.id)
      @item.destroy
    end
    redirect_to :selling_users
  end

  def search
    @brands = Brand.where('name LIKE(?)', "%#{params[:name]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def pickup_categories(women, menz, baby, cosume)
    @ladies = Item.includes(:likes, :snslikes).get_items_category(women.self_and_descendants)
    @menzes = Item.includes(:likes, :snslikes).get_items_category(menz.self_and_descendants)
    @babies = Item.includes(:likes, :snslikes).get_items_category(baby.self_and_descendants)
    @cosumes = Item.includes(:likes, :snslikes).get_items_category(cosume.self_and_descendants)
  end

  def pickup_brands(chanel, nike, puma, vuitton)
    @chanels = Item.includes(:likes, :snslikes).get_items_brand(chanel)
    @nikes = Item.includes(:likes, :snslikes).get_items_brand(nike)
    @pumas = Item.includes(:likes, :snslikes).get_items_brand(puma)
    @vuittons = Item.includes(:likes, :snslikes).get_items_brand(vuitton)
  end

  def item_params
    brand = Brand.find_by(name: params[:item][:brand_name])
    brand_id = (brand.present?) ? (brand.id) : nil
    params.require(:item).permit(:name, :price, :description, :category_id, :shipping_date_id, :condition_id, :region_id, :delivery_fee_id, :ship_method_id, :brand_id, :size_id, item_photos_attributes: [:id, :photo]).merge(saler_id: current_user.id, brand_id: brand_id)
  end

  def get_item
    @item = Item.find(params[:id])
  end
end
