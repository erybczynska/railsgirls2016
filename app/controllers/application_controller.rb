class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def authenticate_user(username, password)
    user = User.where(:username => username, :password => password).first
    if user
      session[:user] = user.id
    else
      session[:user] = nil
    end
  end

  def logout_user
    session[:user] = nil
  end

  def current_user
    @current_user ||= User.find(session[:user]) if session[:user]
  end

end
