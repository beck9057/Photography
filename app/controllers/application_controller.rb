class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def hide_from_unauthenticated
    not_found unless user_signed_in?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
end
