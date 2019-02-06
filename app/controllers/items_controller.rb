class ItemsController < ApplicationController
  # トップページ作成でindex利用
  def index
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @score = Score.all
  end
end
