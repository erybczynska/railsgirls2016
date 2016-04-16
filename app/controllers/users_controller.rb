class UsersController < ApplicationController
  def signup

  end
  def create
    user_params = params["user"].permit("first_name", "last_name", "username", "password")
    user = User.create(user_params)
    redirect_to(root_path)
  end
  def signin

  end
  def login
    user_params = params["user"].permit('username', "password")
    authenticate_user(user_params['username'], user_params['password'])
    redirect_to(root_path)
  end

  def logout
    logout_user
    redirect_to(root_path)
  end
end
