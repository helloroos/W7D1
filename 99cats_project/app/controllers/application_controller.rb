class ApplicationController < ActionController::Base
  # -reset session_token
  # -generate session_token

  # Available in views
  helper_method :current_user
  helper_method :logged_in?


  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end


  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    # !(!current_user)
    # boolean conversion
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
  end



end


