class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      @current_order ||= Order.where(session[:order_id]["$oid"])
    end
  end

  
  helper_method :current_user
  helper_method :logged_in?

  def current_user

    if(session[:user_id])
      @current_user ||= User.find(session[:user_id]["$oid"])  
    end

  end

  def logged_in?
    !current_user
  end

  protected

  
end


