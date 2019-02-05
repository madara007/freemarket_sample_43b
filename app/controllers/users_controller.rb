class UsersController < ApplicationController
 layout  "session", except: [:index, :show, :edit]
# ログイン画面への遷移)(仮)
  def new
  end

# ユーザーの新規登録画面(仮)
  def registration
  end

  def index

  end

  def show
  end

  def edit
  end
end
