class UsersController < ApplicationController
 layout  "session", except: [:index, :show, :edit, :logout]
# ログイン画面への遷移)(仮)
  def new
  end

  def index
  end

  def show
  end

  def edit
  end

  def logout
  end
end
