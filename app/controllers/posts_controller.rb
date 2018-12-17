class PostsController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def index
    redirect_to home_path
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    # @new_comment = Comment.build_from(@post, current_user.id, '')
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def create
    # params[:user_id_id] = session[:user_id]
    @post = Post.new(post_params)
    # @post.user_id_id = current_user.id

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def tagged
    if params[:tag].present?
      @post = Post.tagged_with(params[:tag])
    else
      @post = Post.all
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :tag_list)
  end
end
