class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
     # session[:user_id] = @user.id
      @user.send_activation_email
      redirect_to home_path, notice: 'Check You email to activate account'
      # redirect_to user_path(session[:user_id]), notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    @post = Post.where(user_id: session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(allowed_params)
      redirect_back(fallback_location: users_path)
      flash[:notice] = 'Info changed successful'
    else
      redirect_back(fallback_location: users_path)
      flash[:notice] = 'Something went wrong. Try again later'
    end
  end

  def check

  end

  private

  def allowed_params
    params.require(:user).permit(:username, :email, :password)
  end

end
