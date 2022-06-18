class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page. Please Sign In."
      redirect_to '/'
    end
  end

  def is_admin?
    current_user && current_user.admin
  end
end
