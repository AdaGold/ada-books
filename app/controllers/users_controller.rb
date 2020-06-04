class UsersController < ApplicationController

  skip_before_action :require_login, except: [:current_user]

  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.find_by(uid: auth_hash[:uid],
                        provider: params[:provider])
    
    if user # User exists
      flash[:notice] = "Existing user #{user.username} is logged in."

    else # User doesn't exist yet (new user)

      user = User.build_from_github(auth_hash)
      if user.save
        flash[:success] = "Logged in as new user #{user.username}"
      else
        flash[:error] = "Could not create user account  #{user.errors.messages}"
        return redirect_to root_path
      end
    end

    session[:user_id] = user.id
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
    return
  end

  def current
    @current_user = User.find_by(id: session[:user_id])
    unless @current_user
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path
      return
    end
  end
end
