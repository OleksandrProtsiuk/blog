class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated?
      user.activate
      flash[:success] = 'Account activated!'
      redirect_to login_path
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to home_path
    end
  end
end

