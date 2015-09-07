class UsersController < ApplicationController

       before_action :authenticate_user!
   def index
       @users = User.all
   end

   def show
       @user = User.find(params[:id])
   end

   def following
       @title = "Following"
       @user = User.find(params[:id])
       @users = @user.followings.all.paginate(:page => params[:page])
       render 'show_follow'
   end

   def followers
       @title = "Followers"
       @user = User.find(params[:id])
       @users = @user.followers.all.paginate(:page => params[:page])
       render 'show_follow'
   end
end
