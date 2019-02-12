class RegionsController < ApplicationController
  def index
    @regions = Region.where(params[:id])
  end

  def show
    @region = Region.find(params[:id])
  end
end
