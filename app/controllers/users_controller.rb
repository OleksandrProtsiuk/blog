class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id]), notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def allowed_params
    params.require(:user).permit(:email, :password)
  end
end
