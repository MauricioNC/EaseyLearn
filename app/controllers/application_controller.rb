class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper_method :logged_in?
  helper_method :current_user
  private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_login
    unless logged_in?
      redirect_to login_path, notice: 'You have to be logged in'
    end
  end
end
