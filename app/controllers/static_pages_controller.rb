class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def home
    @post = Post.all
  end

  def contacts; end

  def help; end
end
