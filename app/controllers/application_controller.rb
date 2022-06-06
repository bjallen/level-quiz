class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    return current_user if current_user.present?

    if session[:oktastate].present?
      @current_user = User.find_by(uid: session[:oktastate])
    else
      redirect_to login_path
    end
  end

  def after_sign_in_path_for(_resource)
    request.env['omniauth.origin'] || root_path
  end
end
