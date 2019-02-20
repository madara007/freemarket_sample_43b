class BrandsController < ApplicationController
  def index
    @brand_index = Brand.where(params[:id])
  end

  def show
    @brand = Brand.find(params[:id])
  end
end
