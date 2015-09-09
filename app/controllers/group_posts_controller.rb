class GroupPostsController < ApplicationController
	before_action :authenticate_user!

  def index
      @group = Group.where(:id => params[:group_id]).first
      @group_posts = @group.group_posts.all
  end
  
  def new 
      @group = Group.where(:id => params[:group_id]).first
      @group_post = @group.group_posts.build
  end

  def create 
      @group = Group.where(:id => params[:group_id]).first
      @group_post = @group.group_posts.build(group_post_params)
      @group_post.save
      redirect_to group_path(params[:group_id])
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

  def show
      @group = Group.where(:id => params[:group_id]).first
      @group_post = @group.group_posts.where(:id => params[:id]).first
  end

  def like
      value = params[:type] == "like" ? 1 : -1
      @group = Group.where(:id => params[:group_id]).first
      @group_post = GroupPost.find(params[:id])
      @group_post.add_or_update_evaluation(:likes, value, current_user)
      redirect_to :back
  end

  private

  def group_post_params
      params[:group_post].permit(:group_id,:title)
  end


end
