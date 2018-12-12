class StaticPagesController < ApplicationController
  def home
    @post = Post.all
  end

  def contacts
  end

  def help
  end
end
