class ShipMethodsController < ApplicationController
  layout false
  def index
    if params[:id] == "1"
      @ship_methods = ShipMethod.all
    elsif params[:id] == "2"
      ids = [1,3,6,7]
      @ship_methods = ShipMethod.where(id:ids)
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
end
