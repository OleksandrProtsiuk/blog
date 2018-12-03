class SessionsController < ApplicationController
  skip_before_action :require_login

  def login; end

  def create
    # render plain: params[:password].inspect
    user = User.find_by_name(params[:name])
    if user & user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      redirect_to home_path
    end
  end


  def logout
    reset_session
    redirect_to home_path
  end
end
