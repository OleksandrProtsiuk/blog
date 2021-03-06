class CommentsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :body, :user_id)
  end

end
