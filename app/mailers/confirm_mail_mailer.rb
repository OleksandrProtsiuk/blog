class ConfirmMailMailer < ApplicationMailer
  default from: 'admin@blog.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to family.')
  end

  def confirm_email
    @user = params[:user]
    domain = '0.0.0.0:3000'
    @url = "#{domain}/users/#{@user.id}"
    mail(to: @user.email, subject: 'The last registration step.')
  end
end
