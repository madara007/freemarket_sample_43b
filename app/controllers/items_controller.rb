class ItemsController < ApplicationController
  # トップページ作成でindex利用
  def index
  end

  def new
  end

  def show
    @item = Item.find(1)
    @score = Score.all
  end
end
