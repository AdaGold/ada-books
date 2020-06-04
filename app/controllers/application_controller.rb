class ApplicationController < ActionController::Base

  before_action :require_login

  def current_user
    # return user matching id from session variable
    return @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to do that"
      redirect_to root_path
    end
  end

end
