class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :sns_user
  helper_method :totals
  layout :layout_by_resource

  def totals
   item = @item
   like = Like.where(item_id: item)
   snslike = Snslike.where(item_id: item)
   total = like.length + snslike.length
  end
   
  def sns_user
    Snscredential.find(session[:snscredential_id]) if session[:snscredential_id]
  end

  protected

  def layout_by_resource
    if devise_controller?
      "session"
    else
      "application"
    end
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end

end

