class CommentsController < ApplicationController
  def index
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params.require(:comment).permit(:body))
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
      # redirect_to @post
    else
      render :new
    end  
  end

  def delete
  end

  def destroy
  end
end
