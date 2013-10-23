module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(remember_token: session[:remember_token])
  end
end
