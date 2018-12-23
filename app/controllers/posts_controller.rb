class PostsController < ApplicationController
  skip_before_action :require_login, only: [:show, :tagged]

  def index
    redirect_to home_path
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by_slug(params[:slug])
  end

  def edit
    @post = Post.find_by_slug(params[:slug])
  end

  def update
    @post = Post.find_by_slug(params[:slug])

    if @post.update(post_params)
       @post.slug = Russian.translit(@post.title).parameterize.truncate(80, omission: '')
       @post.update(post_params)
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
    @post = Post.new(post_params)
    @post.slug = Russian.translit(@post.title).parameterize.truncate(80, omission: '')

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def preview
    @post = Post.new(post_params)
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
    params.require(:post).permit(:title, :body, :user_id, :tag_list, :slug)
  end

end
