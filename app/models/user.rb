class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # attr_accessor :address, :name, :email

  # before_save :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  #   devise_parameter_sanitizer.permit(:account_update,
  #                                     keys: %i[name email password password_confirmation current_password])
  # end
end
