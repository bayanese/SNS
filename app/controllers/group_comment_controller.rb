class GroupCommentController < ApplicationController

         before_action :authenticate_user!
   def create
       @group = Group.where(:id => params[:group_id]).first
       @group_post = GroupPost.where(:id => params[:group_post_id]).first
       @group_comment = @group_post.group_comments.create(group_comment_params)
       redirect_to group_post_path(@group_post.id)
   end

   def edit
       @group_post = GroupPost.where(:id => params[:group_post_id]).first
       @group_comment = @group_post.group_comments.where(:id => params[:id]).first
   end

   def update
       @group_post = GroupPost.where(:id => params[:group_post_id]).first
       @group_comment = @group_post.group_comments.where(:id => params[:id]).first
       @group_comment.update(group_comment_params)
       redirect_to group_post_path(params[:group_post_id])
   end

   def destroy
       @group_post = GroupPost.where(:id => params[:group_post_id]).first
       @group_comment = @group_post.group_comments.where(:id => params[:id]).first
       @group_comment.destroy
       redirect_to group_post_path(params[:group_post_id])
   end    
		         
   def like
       value = params[:type] == "like" ? 1 : -1
       @group_post = GroupPost.find(params[:id])
       @group_comment.add_or_update_evaluation(:likes, value, current_user)
       redirect_to :back
   end
		       
   private

   def group_comment_params
   params[:group_comment].permit(:title)
   end

end
		           

end
end
