class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :validate_login


  def validate_login
    unless logged_in?
      flash[:errors] ||= []
      flash[:errors] << "Not authorized for this section"
      redirect_to users_url
    end
  end

  def current_user
    @current_user ||= User.find_by_user_token(session[:token])
  end

  def logged_in?
      !!current_user
  end
end
