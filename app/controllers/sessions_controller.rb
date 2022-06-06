class SessionsController < ApplicationController
  def new
    render :new
  end

  def okta
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:oktastate] = request.env["omniauth.auth"]["uid"]
    redirect_to root_path
  end

  def destroy
    session[:oktastate] = nil
    @current_user = session[:oktastate]
    @session = session[:oktastate]
    redirect_to root_path
  end
end
