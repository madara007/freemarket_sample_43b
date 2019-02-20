class SizesController < ApplicationController
  before_action :authenticate_user!
  layout false

  def show
    group_id = Category.find(params[:id]).group
    @sizes = Size.where(group: group_id)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
