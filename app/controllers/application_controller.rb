class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def authenticate_user(username, password)
    user = User.where(:username => username, :password => password).first
    if user
      @current_user = user
    else
      @current_user = nil
    end
  end

  def current_user
    @current_user
  end

end
