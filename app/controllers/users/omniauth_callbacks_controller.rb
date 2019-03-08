# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  # devise :omniauthable, omniauth_providers: [:facebook]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  def facebook
    callback_from :facebook
  end

  def google_oauth2
    callback_from :google_oauth2
  end

  private

  def callback_from(provider)
    $select_page = request.env['omniauth.origin']
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'], $select_page)

    if @user == false
      redirect_to $select_page
    else
      if @user.new_record?
        @user.build_profile.created_at = Date.today.to_time
        @user.save(context: :created_at)
        binding.pry
      end
      sign_in_and_redirect @user, event: :authentication
    end
  end

  def after_sign_in_path_for(resource)
    if $select_page.match(/sign_in/)
      root_path
    else
      user_profile_path(resource)
    end
  end

end
