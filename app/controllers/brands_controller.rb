class BrandsController < ApplicationController
  def index
    @brands = Brand.where(params[:id])
  end

  def show
    @brand = Brand.find(params[:id])
  end
end
