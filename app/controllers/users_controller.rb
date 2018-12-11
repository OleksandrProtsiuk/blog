class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      redirect_to home_url, notice: 'Thank you for signing up!'
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:email, :password)
  end
end
