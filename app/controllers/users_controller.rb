class UsersController < ApplicationController
 layout  "session", except: [:index, :show, :edit, :logout]
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def logout
  end
end
