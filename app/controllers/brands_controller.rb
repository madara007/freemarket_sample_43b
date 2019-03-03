class BrandsController < ApplicationController
  def index
    @brand_index = Brand.where(params[:id])
  end

  def show
    @brand = Brand.find(params[:id]).items.includes(:likes).order("id DESC")
  end
end
