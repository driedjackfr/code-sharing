class ApplicationController < ActionController::Base
  before_action :add_permitted_key, if: :devise_controller?

  protected

  def add_permitted_key
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
