class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :logged_in_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    return if logged_in?

    redirect_to root_path
    flash[:danger] = 'Please log in or create a new user.'
  end
end
