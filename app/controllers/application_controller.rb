class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:redirect_url] = request.url
      redirect_to(login_path, alert: 'Verify login and password please')
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end
end
