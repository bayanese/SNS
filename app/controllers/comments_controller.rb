class CommentsController < ApplicationController
	 before_action :authenticate_user!

  def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      redirect_to post_path(@post.id)
  end

  def edit
      @post = Post.where(:id => params[:post_id]).first
      @comment = @post.comments.where(:id => params[:id]).first
  end

  def update
      @post = Post.where(:id => params[:post_id]).first
      @comment = @post.comments.where(:id => params[:id]).first
      @comment.update(comment_params)
      redirect_to post_path(params[:post_id])
  end

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to post_path(params[:post_id])
  end

  def like
      value = params[:type] == "like" ? 1 : -1
      @comment = Comment.find(params[:id])
      @comment.add_or_update_evaluation(:likes, value, current_user)
      redirect_to :back
  end

  private

  def comment_params
      params[:comment].permit(:title).merge(user_id: current_user.id)
  end

  
end
