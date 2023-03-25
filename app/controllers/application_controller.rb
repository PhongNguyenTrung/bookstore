class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def current_cart
    @current_cart ||= Cart.find_or_create_by(user_id: current_user.id)
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password password_confirmation current_password])
  end
  
end
