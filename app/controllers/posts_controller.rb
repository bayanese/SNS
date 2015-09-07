class PostsController < ApplicationController

before_action :set_post, only: [:show, :edit, :update, :destroy]

   def index
       @posts = Post.all
   end

   def show
   end 
   
   def new
       @post = Post.new
   end

   def create
       @post = Post.new(post_params)
         if @post.save
         redirect_to posts_path
         else
         render 'new'
         end 
   end

   def edit
   end

   def update
        if @post.update(post_params)
        redirect_to posts_path
        else
        render 'edit'
	end  
   end

   def destroy
       @post.destroy
       redirect_to posts_path
   end

   def change
       change_table :posts do |t|
       t.foreign_key :users, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
      end
   end

   def like
       value = params[:type] == "like" ? 1 : -1
       @post = Post.find(params[:id])
       @post.add_or_update_evaluation(:likes, value, current_user)
       redirect_to :back
   end

   private

   def post_params
       params[:post].permit(:title).merge(user_id: current_user.id)
   end

   def set_post
       @post = Post.find(params[:id])
   end

end
