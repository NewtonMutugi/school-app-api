class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
     #devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name,:username, :email, :avatar)
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :email, :password])
     #devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name, :surname, :email, :avatar)
  end
end
