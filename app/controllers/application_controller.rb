class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :logged_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_current_user
    # finds user with session data and stores it if present
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !@current_user.nil?
  end

  def require_user_logged_in!
    # allows only logged in user
    redirect_to sign_in_path, alert: "You must be signed in" if @current_user.nil?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
