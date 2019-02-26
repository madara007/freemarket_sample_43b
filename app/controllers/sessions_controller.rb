# class SessionsController < Devise::SessionsController
#   prepend_before_action :captcha_valid, only: [:create]

#   def captcha_valid
#     if verify_recaptcha
#       true
#     else
#       self.resource = resource_class.new(sign_in_params)
#       respond_with_navigational(resource) { render :new }
#     end
#   end

# end
