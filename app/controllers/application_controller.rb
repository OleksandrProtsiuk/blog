class ApplicationController < ActionController::Base
  before_action :require_login
  private

  def require_login
    unless current_user
      redirect_to login_path # прерывает цикл запроса
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
