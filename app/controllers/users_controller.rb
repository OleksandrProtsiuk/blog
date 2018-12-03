class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.required(:user).permit(:name, :password_digest))
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      print 'foo'
    end
  end
end
