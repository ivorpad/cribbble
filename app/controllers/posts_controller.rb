class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create!(post_params)
    if @post.save
      redirect_to @post
    else
      render posts_path
    end
  end

  def categorized
    @posts = Post.with_tags(params[:id])
    render "categorized"
  end

  def patch
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :description, :faves, :image, :tag_list)
  end
end
