class SessionsController < ApplicationController
  def new; end
'
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(session[:user_id]), notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render :new
    end
  end
'
  def destroy
    session[:user_id] = nil
    redirect_to home_url, notice: 'Logged out!'
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      if user.activated?
        session[:user_id] = user.id
        redirect_to user_path(session[:user_id]), notice: "Logged in!"
      else
        flash[:notice] = 'Account not activated. Check your email for the activation link'
        redirect_to home_path
      end
    else
      flash.now[:notice] = 'Invalid email/password combination'
      render 'new'
    end
  end
end

