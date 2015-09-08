class GroupPostCommentsController < ApplicationController

	 before_action :authenticate_user!
  def create
      @group_post = GroupPost.find(params[:group_post_id])
      @group_post_comment = @group_post.group_post_comments.create(group_post_comment_params)
      redirect_to post_path(@group_post.id)
  end

  def edit
      @group_post = GroupPost.where(:id => params[:group_post_id]).first
      @group_post_comment = @group_post.group_post_comments.where(:id => params[:id]).first
  end

  def update
      @group_post = GroupPost.where(:id => params[:group_post_id]).first
      @group_post_comment = @group_post.group_post_comments.where(:id => params[:id]).first
      @group_post_comment.update(group_post_comment_params)
      redirect_to group_post_path(params[:group_post_id])
  end

  def destroy
      @group_post = GroupPost.where(:id => params[:group_post_id]).first
      @group_post_comment = @group_post.group_post_comments.where(:id => params[:id]).first
      @group_post_comment.destroy
      redirect_to group_post_path(params[:group_post_id])
  end

  private

  def group_post_comment_params
      params[:group_post_comment].permit(:title)
  end


end
