class GroupPostsController < ApplicationController
	before_action :authenticate_user!

  def new 
      @group = Group.where(:id => params[:group_id]).first
      @group_post =@group.group_posts.build
  end

  def edit
      @group = Group.where(:id => params[:group_id]).first
      @group_post = @group.group_posts.where(:id => params[:id]).first
  end

  def update
      @group = Group.where(:id => params[:group_id]).first
      @group_post = @group.group_posts.where(:id => params[:id]).first
      @group_post.update(group_post_params)
      redirect_to group_path(params[:group_id])
  end

  def destroy
      @group = Group.where(:id => params[:group_id]).first
      @group_post = @group.group_posts.where(:id => params[:id]).first
      @group_post.destroy
      redirect_to group_path(params[:group_id])
  end

  private

  def group_post_params
      params[:group_post].permit(:group_id,:title)
  end


end
