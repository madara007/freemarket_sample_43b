class BrandsController < ApplicationController
  def index
    @brand_index = Brand.where(params[:id])
  end

  def show
    @brand_name = Brand.find(params[:id])
    @brand_list = Brand.find(params[:id]).items.includes(:likes).order("id DESC")
  end
end
